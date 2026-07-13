module.exports = (sequelize, DataTypes) => {
  const MainRequestTracker = sequelize.define(
    'main_request_tracker',
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },

      user_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },

      from_date: {
        type: DataTypes.DATEONLY,
        allowNull: true,
      },

      to_date: {
        type: DataTypes.DATEONLY,
        allowNull: true,
      },

      request_type: {
        type: DataTypes.ENUM('leave', 'timesheet'),
        allowNull: true,
      },

      tracker: {
        type: DataTypes.ENUM('laptop', 'mobile'),
        allowNull: true,
      },

      status: {
        type: DataTypes.ENUM('pending', 'approve', 'cancel', 'reject'),
        allowNull: true,
      },

      created_date: {
        type: DataTypes.DATE,
        allowNull: true,
      },

      modified_date: {
        type: DataTypes.DATE,
        allowNull: true,
      },

      created_by: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },

      modified_by: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },

      is_active: {
        type: DataTypes.TINYINT(1),
        allowNull: true,
        defaultValue: 1,
      },
    },
    {
      tableName: 'main_request_tracker',
      timestamps: false,
      underscored: true,
    }
  );

  MainRequestTracker.associate = models => {
    MainRequestTracker.belongsTo(models.main_users, {
      foreignKey: 'user_id',
      as: 'user',
    });
  };

  return MainRequestTracker;
};
