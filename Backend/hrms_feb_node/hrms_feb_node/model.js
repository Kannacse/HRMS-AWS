const mysql = require('mysql2/promise');
// const redis = require('redis');
const dbconfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
};

// const client = redis.createClient();
// client.on('connect', () => {console.log(client,"client")
//   console.log('Connected to Redis server');
// });

// client.on('error', (err) => {
//   console.error('Redis error:', err);
// });

const provisionQuery = async (query, params) => {

  try{
    const connection = await mysql.createConnection(dbconfig);
    const [result] = await connection.execute(query, params);
    await connection.end();
    return result;
  }catch(err){
    throw new Error(`Connection Error:${err.message}`);
  }
};


module.exports = provisionQuery;
