const { DataTypes } = require("sequelize");

module.exports = (sequelize,DataTypes) => {
  const LeaveTypes = sequelize.define('tbl_user_leave_type',{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    userid:{
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    employeeleavetypesid:{
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    employment_id:{
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    emp_status_id:{
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    number_of_days:{
      type: DataTypes.FLOAT,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    used_leaves:{
      type: DataTypes.FLOAT,
      allowNull: true,
        validate: {
        notEmpty: true
      },
      defaultValue: 0,
    },
    alloted_year:{
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    is_carry_forward:{
      type: DataTypes.TINYINT,
      allowNull: true,
        validate: {
        notEmpty: true
      }
    },
    carry_forward_leave:{
      type: DataTypes.INTEGER,
      allowNull: true,
        validate: {
        notEmpty: true
      }
    },
    is_blocked:{
      type: DataTypes.TINYINT,
      allowNull: true,
        validate: {
        notEmpty: true
      }
    },
    createdby: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    modifiedby: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    created_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    modified_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    isactive: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 1
    },
  },{
    timestamps: false,
    tableName: "tbl_user_leave_type",
  });

  LeaveTypes.associate = (models) => {
    LeaveTypes.belongsTo(models.main_users, { foreignKey : 'userid', as : 'user_id_lve_type'});
    LeaveTypes.belongsTo(models.main_employees_summary, { foreignKey : 'userid', targetKey : 'user_id', as : 'user_id_lve_type_summary'});
    LeaveTypes.belongsTo(models.main_employeeleavetypes, { foreignKey : 'employeeleavetypesid', as : 'main_lve_type_id'});
  };

  return LeaveTypes;
}