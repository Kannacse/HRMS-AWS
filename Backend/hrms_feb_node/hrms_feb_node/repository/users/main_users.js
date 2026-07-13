const db = require("../../models");
const MainUsers = db.main_users;
const { Op } = require("sequelize");

// repository/users/main_users.js
const userdata = async (username, password, ipAddress) => {
  try {
    // Check inactive user
    const inactiveUser = await MainUsers.findOne({
      where: {
        [Op.or]: [
          { emailaddress: username },
          { employeeid: username }
        ],
        isactive: 0
      }
    });

    if (inactiveUser) {
      return {
        success: false,
        reason: 'INACTIVE'
      };
    }

    // Check active user with password
    const result = await MainUsers.findOne({
      where: {
        [Op.or]: [
          { emailaddress: username },
          { employeeid: username }
        ],
        emppassword: password,
        isactive: 1
      }
    });

    // ✅ INVALID credentials
    if (!result) {
      return {
        success: false,
        reason: 'INVALID'
      };
    }

    // Login log (safe now)
    const groupId = await db.sequelize.query(
      `select group_id from main_roles where id = :empRole`,
      {
        replacements: { empRole: result.emprole },
        type: db.sequelize.QueryTypes.SELECT
      }
    );

    await db.sequelize.query(
      `
      INSERT INTO main_userloginlog
      (userid, emprole, group_id, employeeId, emailaddress, userfullname, logindatetime, empipaddress, tracker)
      VALUES
      (:userId, :empRole, :groupId, :employeeId, :emailAddress, :userFullName, NOW(), :empIpAddress, :tracker)
      `,
      {
        replacements: {
          userId: result.id,
          empRole: result.emprole,
          groupId: groupId[0]?.group_id || null,
          employeeId: result.employeeId,
          emailAddress: result.emailaddress,
          userFullName: result.userfullname,
          empIpAddress: ipAddress,
          tracker: 'mobile'
        }
      }
    );

    return {
      success: true,
      user: [result]
    };

  } catch (err) {
    throw err; // let service handle
  }
};

module.exports = { userdata };
