const { environment } = require('@rails/webpacker');
const dotenv = require("dotenv");

dotenv.config({ path: ".env", silent: true });

module.exports = environment;
