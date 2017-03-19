require('./html/index.html');
require('./css/screen.css');

const Elm = require('./elm/Main.elm');
const $main = document.getElementById('root');

const app = Elm.Main.embed($main);
