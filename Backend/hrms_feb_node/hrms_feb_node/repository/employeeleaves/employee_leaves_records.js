const db = require("../../models");
const MainLeaveRequest = db.main_leaverequest;
const MainEmployeesummary = db.main_employees_summary;
const MainUsers = db.main_users;
const MainLeaveTypes = db.main_employeeleavetypes;
const { Op } = require("sequelize");
const LeaveHistory = db.main_leaverequest_history;


const getLeavesByRole = async (user_id, emprole, month, year) => {
    // Build date range filter for the selected month and year (frontend always passes both)
    const dateFilter = buildMonthYearFilter(month, year);

    const ALLOWED_STATUSES = [
        'Approved',
        'Pending for approval'
    ];

    const EXCLUDED_LEAVE_TYPES = [8, 10];


    // 1) DIRECTOR = Full Access
    // if (emprole === 2) {
    if (user_id == 3) {
        // Directors get full access but filtered to the requested month/year
        const leaves = await MainLeaveRequest.findAll({
            where: {
                [Op.and]: [
                    dateFilter,
                    {
                        leavestatus: {
                            [Op.in]: ALLOWED_STATUSES
                        }
                    },
                    {
                        leavetypeid: {
                            [Op.notIn]: EXCLUDED_LEAVE_TYPES
                        }
                    }
                ],
                isactive: 1
            },
            include: [
                { model: MainLeaveTypes, as: 'main_lve_type_id', attributes: ['leavetype'] },
                { model: MainEmployeesummary, as: 'emp_sum_lve_req', attributes: ['reporting_manager', 'reporting_manager_name', 'employeeId', 'userfullname'] }

            ]
        });
        return mapLeavesToFrontendFormat(leaves);
    }

    // 2) Check if user is a reporting manager
    const teamMembers = await MainEmployeesummary.findAll({
        where: {
            reporting_manager: user_id
        }
    });

    // If user is not a reporting manager → no access
    if (teamMembers.length === 0) {
        return [];
    }

    // Extract all employee IDs under this manager
    const employeeIds = teamMembers.map(emp => emp.user_id);

    // 3) Fetch leave requests ONLY for employees under this manager
    let whereClause = {
        [Op.and]: [
            { user_id: { [Op.in]: employeeIds } },
            dateFilter,
            {
                leavestatus: {
                    [Op.in]: ALLOWED_STATUSES
                }
            },
            {
                leavetypeid: {
                    [Op.notIn]: EXCLUDED_LEAVE_TYPES
                }
            }
        ],
        isactive: 1
    };


    const leaves = await MainLeaveRequest.findAll({
        where: whereClause,
        include: [
            { model: MainLeaveTypes, as: 'main_lve_type_id', attributes: ['leavetype'] },
            { model: MainEmployeesummary, as: 'emp_sum_lve_req', attributes: ['reporting_manager', 'reporting_manager_name', 'employeeId', 'userfullname'] }

        ]
    });
    return mapLeavesToFrontendFormat(leaves);
};

// Helper function to filter by month and year
const buildMonthYearFilter = (month, year) => {
    const startDate = new Date(year, month - 1, 1); // Start of month
    const endDate = new Date(year, month, 0); // End of month

    const startDateStr = startDate.toISOString().split('T')[0]; // YYYY-MM-DD
    const endDateStr = endDate.toISOString().split('T')[0];

    // Filter where leave overlaps with the month
    // (from_date <= end of month) AND (to_date >= start of month)
    return {
        [Op.and]: [
            {
                from_date: {
                    [Op.lte]: endDateStr
                }
            },
            {
                to_date: {
                    [Op.gte]: startDateStr
                }
            }
        ]
    };
};

// Helper function to map Sequelize leave records to frontend-friendly format
const mapLeavesToFrontendFormat = (leaves) => {

    return leaves.map(l => ({
        id: l.id,
        employeeId: l.emp_sum_lve_req?.employeeId || '',
        name: l.emp_sum_lve_req?.userfullname || '',
        status: l.leavestatus || '',
        leaveType: l.main_lve_type_id ? l.main_lve_type_id.leavetype : '',
        noOfDays: l.appliedleavescount || 0,
        from_date: l.from_date ? new Date(l.from_date).toISOString().split('T')[0] : null,
        to_date: l.to_date ? new Date(l.to_date).toISOString().split('T')[0] : null,
        appliedOn: l.createddate ? l.createddate.toISOString().split('T')[0] : null,
        leavetypeid: l.leavetypeid,
        leavePeriod: l.leave_period,
        reportingManagerName: l.emp_sum_lve_req?.reporting_manager_name || '',
        rep_mang_id: l.emp_sum_lve_req?.reporting_manager || null,
        leaveDay: l.leaveday,
        appliedLeavescount: l.appliedleavescount,
        comments: l.approver_comments || '',
    }));
};

const saveLeaveHistory = async (dataEntry) => {
    try {
        const result = await LeaveHistory.create(
            dataEntry,
            {
                logging: console.log,
            }
        );
        return result;
    } catch (err) {
        console.log(`Database error ${err.message}`);
    }
}

module.exports = {
    getLeavesByRole,
    saveLeaveHistory
};
