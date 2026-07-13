module.exports = (sequelize, DataTypes) => {
  const MainLeaveTypes = sequelize.define('main_employeeleavetypes',{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    leavetype: {
      type: DataTypes.STRING,
      allowNull: true
    },
    leavecode: {
      type: DataTypes.STRING,
      allowNull: true
    },
    description	: {
      type: DataTypes.STRING,
      allowNull: true
    },
    maxapprovedays: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    leavepreallocated: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    leavepredeductable: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    sandwichleave: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    carryforward: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    number_of_leaves_carry_forward: {
      type: DataTypes.STRING,
      allowNull: true
    },
    elapse_period: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    elapse_per_year: {
      type: DataTypes.STRING,
      allowNull: true
    },
    leave_flag: {
      type: DataTypes.STRING,
      allowNull: true
    },
    multiple_date_flag: {
      type: DataTypes.STRING,
      allowNull: true
    },
    createdby 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    modifiedby 	:{
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

  },{
    timestamps: false,
    tableName: "main_employeeleavetypes",
  });

  MainLeaveTypes.associate = (models) => {
    MainLeaveTypes.hasMany(models.tbl_user_leave_type, { foreignKey : 'employeeleavetypesid', as : 'lve_type_id_main'});
  };

  return MainLeaveTypes;
}


