const express = require('express');

const app = express();

const port = 3000;

// TODO: Add favicon
// app.use(favicon(path.join(__dirname, 'static', 'favicon.ico')))

app.get('*/main.dart.js', (req, res) => {
    res.sendFile(`${__dirname}/src/build/web/main.dart.js`);
});

app.get('*/styles.css', (req, res) => {
    res.sendFile(`${__dirname}/src/build/web/styles.css`);
});

app.get('/*', (req, res) => {
    res.sendFile(`${__dirname}/src/build/web/index.html`);
});

app.listen(port, 'localhost', (err)  => {
    if (err) {
        console.log(err);
        return;
    }

    console.log(`Listening at http://localhost:${port}`);
});