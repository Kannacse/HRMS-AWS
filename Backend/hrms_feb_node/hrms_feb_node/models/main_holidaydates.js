module.exports = (sequelize,DataTypes) => {

  const MainHolidayDates = sequelize.define('main_holidaydates',{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    holidayname:{
      type: DataTypes.STRING,
      allowNull: true
    },
    groupid:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    holidaydate:{
      type: DataTypes.DATE,
      allowNull: true
    },
    holidayyear:{
      type: DataTypes.STRING(4),
      allowNull: true
    },
    description:{
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
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 1
    },
  },{
    timestamps: false,
    tableName: "main_holidaydates",
  });

  MainHolidayDates.associate = (models) =>{
    MainHolidayDates.hasMany(models.main_employees_summary, {foreignKey: 'holiday_group', sourceKey: 'groupid', as : 'holiday_group'});
  }

  return MainHolidayDates;

}