const db = require("../../models");

const MainEmployeesummary = db.main_employees_summary;

const getAllEmployees = async () => {
  try {
    const result = await MainEmployeesummary.findAll({
      attributes: [
        "user_id",
        "employeeId",
        "userfullname",
        "emailaddress",
        "department_name",
        "jobtitle_name",
        "project_name",
        "emp_status_name",
        "contactnumber",
        "date_of_joining",
        "isactive"
      ],
      where: {
        isactive: 1
      },
      order: [["userfullname", "ASC"]],
      raw: true
    });

    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
};

module.exports = { getAllEmployees };
