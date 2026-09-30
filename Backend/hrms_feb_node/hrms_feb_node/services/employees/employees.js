const { getAllEmployees } = require('../../repository/employees/employees');

const getEmployees = async () => {
  try {
    const employees = await getAllEmployees();

    return {
      success: true,
      employees
    };
  } catch (error) {
    return {
      success: false,
      error: error.message
    };
  }
};

module.exports = { getEmployees };
