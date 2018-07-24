const axios = require('axios').default;
const config = require('../config');

module.exports = function (app) {

    app.get('/api/hub*', function (request, response) {
        const headers = {Authorization: `Bearer ${config.c3pr.auth.jwt}`};

        const targetUrl = request.originalUrl.replace(/^\/api\/hub/, '');

        axios.get(config.c3pr.hub.c3prHubUrl + targetUrl, {headers}).then(({data}) => {
            response.send(data);
        }).catch(e => {
            response.send(e.toString());
        })
    });

};