module.exports = (sequelize, DataTypes) => {
  const LeaveHistory = sequelize.define('main_leaverequest_history',{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    leaverequest_id:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    description:{
      type: DataTypes.STRING,
      allowNull: true
    },
    createdby:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    modifiedby:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    createddate:{
      type: DataTypes.DATE,
      allowNull: true
    },
    modifieddate:{
      type: DataTypes.DATE,
      allowNull: true
    },
    isactive:{
      type: DataTypes.TINYINT,
      allowNull: true
    },
  },{
    timestamps: false,
    tableName: "main_leaverequest_history",
  });

  return LeaveHistory;
}