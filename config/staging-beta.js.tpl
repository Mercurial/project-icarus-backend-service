const { raw } = require('config/raw');
const { consoleLogger } = require('../src/logger');

module.exports = {
    server: {
        corsEnabledFor: ['*'],
        logger: raw(consoleLogger('error')),
        port: 8080,
        importerSendTxEndpoint: 'http://ENDPOINT_HOST:8200/api/txs/signed',
    },
    db: {
        user: 'fake',
        host: 'fake',
        database: 'fake',
        password: 'fake',
        port: '5432',
        min: 4,
        max: 50,
        idleTimeoutMillis: 1000,
        connectionTimeoutMillis: 5000,
    },
};
