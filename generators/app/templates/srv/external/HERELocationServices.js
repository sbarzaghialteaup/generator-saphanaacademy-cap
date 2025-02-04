<% if(credStore !== ''){ -%>
const credStore = require('./../lib/credStore');
<% } -%>

class HERELocationServices extends cds.RemoteService {
    async init() {

        this.reject(['CREATE', 'UPDATE', 'DELETE'], '*');

        this.before('READ', 'Geocodes', async (req) => {
            try {
                let query = 'GET /geocode?apiKey=' + <% if(credStore !== ''){ -%>await credStore.readCredentialValue('<%= credStoreNS %>', 'password', 'APIKeyHERE')<% } else { -%>process.env.APIKeyHERE<% } -%>;
                let select = req.query.SELECT;
                let hasFilter = false;
                if (select.where) {
                    select.where.forEach(element => {
                        if (element.ref && element.ref[0] === 'title') {
                            query += '&q=';
                            hasFilter = true;
                        }
                        else if (element.val) {
                            query += element.val;
                        }
                    });
                }
                if (!hasFilter) {
                    req.reject(`Please provide a filter as follows: Geocodes?$filter=title eq '<value>'`);
                }
                req.query = query;
            } catch (err) {
                console.error(err);
            }
        });

        this.on('READ', 'Geocodes', async (req, next) => {
            const response = await next(req);
            return response.items;
        });

        super.init();
    }
}

module.exports = HERELocationServices;