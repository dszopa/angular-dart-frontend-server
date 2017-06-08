const express = require('express');

const app = express();

const port = 3000;

// TODO: Add favicon
// app.use(favicon(path.join(__dirname, 'static', 'favicon.ico')))

app.use(express.static(`${__dirname}/frontend/build/web`));

app.get('/*', (req, res) => {
    res.sendFile(`${__dirname}/frontend/build/web/index.html`);
});

app.listen(port, 'localhost', (err)  => {
    if (err) {
        console.log(err);
        return;
    }
    console.log(`Listening at http://localhost:${port}`);
});