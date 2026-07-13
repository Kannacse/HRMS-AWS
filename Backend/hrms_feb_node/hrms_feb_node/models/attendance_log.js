module.exports = (sequelize, DataTypes) => {
  const AttendanceLog = sequelize.define('attendance_log', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    employeeId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    date: {
      type: DataTypes.DATE,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    month: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    year: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    day: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    check_in: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    check_out: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    worked_hours: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: true,
    },
    lateby: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    earlyby: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    leave_late_flag: {
      type: DataTypes.TINYINT(4),
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    createdby: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    modifiedby: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    createddate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    modifieddate: {
      type: DataTypes.DATE,
      allowNull: true
    },
  }, {
    timestamps: false,
    tableName: "attendance_log",
  });

  AttendanceLog.associate = (models) => {
    AttendanceLog.belongsTo(models.main_users, { foreignKey: 'user_id', as: 'user_id_attendance' });
  };

  return AttendanceLog;
}