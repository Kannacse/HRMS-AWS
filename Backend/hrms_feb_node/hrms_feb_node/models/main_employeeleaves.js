module.exports = (sequelize,DataTypes) => {
  const MainEmployeeleaves = sequelize.define('main_employeeleaves',{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    leave_eligible:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    emp_leave_limit:{
      type: DataTypes.FLOAT,
      allowNull: true
    },
    used_leaves:{
      type: DataTypes.FLOAT,
      allowNull: true
    },
    alloted_year :{
      type: DataTypes.INTEGER,
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
    isleavetrasnferset: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 0
    },	
  },{
    timestamps: false,
    tableName: "main_employeeleaves",
  });

  MainEmployeeleaves.associate = (models) => {
    MainEmployeeleaves.belongsTo(models.main_users, { foreignKey : 'user_id', as : 'user_id_emp_lve'});
    MainEmployeeleaves.belongsTo(models.main_employees_summary, { foreignKey : 'user_id', targetKey : 'user_id', as : 'user_id_summary'});
  };

  return MainEmployeeleaves;
}