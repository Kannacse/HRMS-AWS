module.exports = (sequelize, DataTypes) => {
  const MainLogManager = sequelize.define(
    'main_logmanager',
    {
      id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },

      menuId: {
        type: DataTypes.BIGINT,
        allowNull: true,
      },

      module_name: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },

      menu_name: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },

      user_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },

      page_url: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },

      user_action: {
        type: DataTypes.TINYINT.UNSIGNED,
        allowNull: true,
        comment:
          '1-add, 2-edit, 3-delete, 4-active/inactive, 5-cancel, 6-open, 7-approve, 8-reject, 9-download',
      },

      log_details: {
        type: DataTypes.TEXT('long'),
        allowNull: true,
      },

      last_modifiedby: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: true,
      },

      last_modifieddate: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW,
      },

      key_flag: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },

      tracker: {
        type: DataTypes.ENUM('laptop', 'mobile'),
        allowNull: true,
      },

      is_active: {
        type: DataTypes.TINYINT.UNSIGNED,
        allowNull: true,
      },
    },
    {
      tableName: 'main_logmanager',
      timestamps: false, // using custom timestamp column
      indexes: [
        {
          unique: true,
          name: 'obj_action',
          fields: ['menuId', 'user_action'],
        },
      ],
    }
  );

  return MainLogManager;
};
