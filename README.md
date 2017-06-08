# Brainstormer-Web-Frontend
The web-frontend for Brainstormer.

Includes a NodeJS server to serve the frontend for production, 
along with a frontend codebase written in react & dart

## Running Dev environment
From the 'brainstormer-web-frontend' directory run the following commands

```
cd frontend
pub get
pub serve
```

This will spin up a dart development server on `localhost:8080`

## Running Node Server
Simply run
```$xslt
npm start
```
A server node server serving the result of `pub build` will run on `localhost:3000`

### TODO
- Add project structure besides basic Angular Dart  setup
- Decide on frontend libraries and write out the structure