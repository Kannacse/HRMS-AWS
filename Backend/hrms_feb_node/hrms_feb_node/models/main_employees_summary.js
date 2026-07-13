module.exports = (sequelize,DataTypes) => {

  const MainEmployeesummary = sequelize.define("main_employees_summary",{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    date_of_joining:{
      type: DataTypes.DATE,
      allowNull: true
    },
    date_of_leaving	:{
      type: DataTypes.DATE,
      allowNull: true
    },
    reason_for_leaving	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    reporting_manager 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    reporting_manager_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    emp_status_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    emp_status_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    businessunit_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    businessunit_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    department_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    department_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    organization_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    organization_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    jobtitle_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    jobtitle_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    position_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    position_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    project_id 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    project_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    years_exp 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    holiday_group 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    holiday_group_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    prefix_id  	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    prefix_name	 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    extension_number 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    office_number 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    office_faxnumber 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    emprole  	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    emprole_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    firstname 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    lastname 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    userfullname 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    emailaddress 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    contactnumber 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    backgroundchk_status 	:{
      type: DataTypes.ENUM('In process','Completed','Not Applicable','Yet to start','On hold'),
      allowNull: true
    },
    employeeId 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    modeofentry 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    other_modeofentry 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    selecteddate 	:{
      type: DataTypes.DATE,
      allowNull: true
    },
    candidatereferredby	 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    referer_name 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    profileimg 	:{
      type: DataTypes.STRING,
      allowNull: true
    },
    createdby 	:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    createdby_name 	:{
      type: DataTypes.STRING,
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
  },{
    timestamps: false,
    tableName: "main_employees_summary",
  });

  MainEmployeesummary.associate = (models) =>{
     MainEmployeesummary.belongsTo(models.main_users, { foreignKey : 'user_id', as : 'emp_summary'});
     MainEmployeesummary.belongsTo(models.main_holidaydates, {foreignKey: 'holiday_group', targetKey : 'groupid', as : 'holiday_group_summary'});

     MainEmployeesummary.hasMany(models.main_employeeleaves, { foreignKey : 'user_id', sourceKey: 'user_id', as : "user_id_leaves"})
     MainEmployeesummary.hasMany(models.main_leaverequest, { foreignKey : 'user_id', sourceKey: 'user_id', as : "user_id_lve_req"})
    //  MainEmployeesummary.hasMany(models.tbl_user_leave_types, { foreignKey : 'user_id', sourceKey: 'user_id', as : "lve_type_user_id"})
  }

  return MainEmployeesummary;

};