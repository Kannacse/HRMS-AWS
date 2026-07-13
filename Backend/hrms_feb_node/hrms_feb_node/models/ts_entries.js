module.exports = (sequelize, DataTypes) => {
  const TsEntries = sequelize.define('ts_entries',{
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    type_of_mapping:{
      type: DataTypes.STRING,
      allowNull: true
    },
    user_map_id:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    work_mode_id:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    date:{
      type: DataTypes.DATE,
      allowNull: true
    },
    worked_hrs:{
      type: DataTypes.STRING,
      allowNull: true
    },
    status:{
      type: DataTypes.ENUM('Pending','Approved','Rejected','Cancelled'),
      allowNull: true
    },
    flag:{
      type: DataTypes.ENUM('user_request','manager_allocated'),
      allowNull: true
    },
    created_by:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    modified_by:{
      type: DataTypes.INTEGER,
      allowNull: true
    },
    created_date:{
      type: DataTypes.DATE,
      allowNull: true
    },
    modified_date:{
      type: DataTypes.DATE,
      allowNull: true
    },
    is_active:{
      type: DataTypes.TINYINT,
      allowNull: true
    },
  },{
    timestamps: false,
    tableName: "ts_entries",
  });

  return TsEntries;
}