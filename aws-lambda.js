const config = require('config');
const ApiBuilder = require('claudia-api-builder');
const pg = require('pg');
const routes = require('./flow-files/routes');
const dbApi = require('./flow-files/db-api');

const serverConfig = config.get('server');
const api = new ApiBuilder();

Object.values(routes).forEach(({ method, path, handler }) => {
  api[method](path, async req => {
    const db = new pg.Client(config.get('db'));
    await db.connect();
    try {
      return await handler(dbApi(db), serverConfig)(req);
    } finally {
      db.end();
    }
  });
});

module.exports = api;
