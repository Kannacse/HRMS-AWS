module.exports = (sequelize, DataTypes) => {
  const MainLeaveRequest = sequelize.define("main_leaverequest", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    reason: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    approver_comments: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    leavetypeid: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    leaveday: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    leave_period: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    from_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    to_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    leavestatus: {
      type: DataTypes.ENUM('Pending for approval', 'Approved', 'Rejected', 'Cancel'),
      allowNull: true
    },
    loss_of_pay: {
      type: DataTypes.FLOAT,
      allowNull: true
    },
    rep_mang_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    hr_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    no_of_days: {
      type: DataTypes.FLOAT,
      allowNull: true
    },
    appliedleavescount: {
      type: DataTypes.FLOAT(4, 1),
      allowNull: true
    },
    is_sat_holiday: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    is_sandwich_leave: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    compensatory_hrs: {
      type: DataTypes.STRING,
      allowNull: true
    },
    compensatory_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    late_early: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    medical_certificate: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    createdby: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    modifiedby: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    createddate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    modifieddate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    isactive: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 1
    },

  }, {
    timestamps: false,
    tableName: "main_leaverequest",
  });

  MainLeaveRequest.associate = (models) => {
    MainLeaveRequest.belongsTo(models.main_users, { foreignKey: "user_id", as: 'user_lve_req' });
    MainLeaveRequest.belongsTo(models.main_employees_summary, { foreignKey: "user_id", targetKey: "user_id", as: 'emp_sum_lve_req' });
    MainLeaveRequest.belongsTo(models.main_employeeleavetypes, {
      foreignKey: "leavetypeid",
      as: "main_lve_type_id"
    });

  }

  return MainLeaveRequest;
}