var initiates = require('./initiates.coffee');
var scrollHint = require('../blocks/scrollHint/scrollHint.coffee');
var request = require('../blocks/request/request.coffee');

initiates();
smoothAnchorLinks();

scrollHint();
request();
