# Angular-Dart-Frontend-Server

Includes a NodeJS server to serve the frontend for production, 
along with a frontend codebase written in Dart.

Currently serves the result of the Angular Dart Tour of Heroes Tutorial.

## Running Dev environment
From the root directory run the following commands

```
cd frontend
pub get
pub serve
```

This will spin up a dart development server on `localhost:8080`

## Running Node Server

Compile the frontend with:
```$xslt
cd frontend
pub get
pub build
```

Then run
```$xslt
npm start
```
A node server will run on `localhost:3000` serving the contents from frontend
