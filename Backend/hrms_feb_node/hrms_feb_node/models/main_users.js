
module.exports = (sequelize,DataTypes) => {
  const MainUsers = sequelize.define("main_users",{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    emprole: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: true
      }
    },
    userstatus: {
      type: DataTypes.ENUM('new', 'old'),
      allowNull: true
    },
    firstname: {
      type: DataTypes.STRING,
      allowNull: true
    },
    lastname: {
      type: DataTypes.STRING,
      allowNull: true
    },
    userfullname: {
      type: DataTypes.STRING,
      allowNull: true
    },
    emailaddress: {
      type: DataTypes.STRING,
      allowNull: true
    },
    contactnumber: {
      type: DataTypes.STRING,
      allowNull: true
    },
    empipaddress: {
      type: DataTypes.STRING,
      allowNull: true
    },
    backgroundchk_status: {  
       type: DataTypes.ENUM('In process','Completed','Not Applicable','Yet to start','On hold'),   
      allowNull: true
    },
    emptemplock: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    empreasonlocked: {
      type: DataTypes.STRING,
      allowNull: true
    },
    emplockeddate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    emppassword: {
      type: DataTypes.STRING,
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
      type: DataTypes.SMALLINT,
      allowNull: true
    },
    employeeId: {
      type: DataTypes.STRING,
      allowNull: true
    },
    policy_status: {
      type: DataTypes.ENUM('policy_acknowledged','policy_acknowledge_pending'),
      allowNull: true
    },
    modeofentry: {
      type: DataTypes.STRING,
      allowNull: true
    },
    other_modeofentry: {
      type: DataTypes.STRING,
      allowNull: true
    },
    entrycomments: {
      type: DataTypes.STRING,
      allowNull: true
    },
    rccandidatename: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    selecteddate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    candidatereferredby: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    company_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    profileimg: {
      type: DataTypes.STRING,
      allowNull: true
    },
    jobtitle_id: {
      type: DataTypes.BIGINT,
      allowNull: true
    },
    tourflag: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    themes: {
      type: DataTypes.ENUM('default','brown','gray','peacock','skyblue','green','orange'),
      allowNull: true
    },
  },{
    timestamps: false,
    tableName: "main_users",
  });

  MainUsers.associate = (models) => {
    MainUsers.hasMany(models.main_employeeleaves, { foreignKey : 'user_id', as : 'user_id_emp_lve'});
    MainUsers.hasMany(models.main_employees_summary, { foreignKey : 'user_id', as : 'emp_summary'});
    MainUsers.hasMany(models.main_leaverequest, { foreignKey : 'user_id', as : 'leave_req'});
    MainUsers.hasMany(models.attendance_log, { foreignKey : 'user_id', as : "attendance_user_id"})
  };


  return MainUsers;
}