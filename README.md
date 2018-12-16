# Cassette
Toy project using Elm to implement music service backed by Spotify public API

## Development Setup

### Prerequisite
- NodeJs verion >= 8

**Install `elm`, `elm-format` and `create-elm-app`**
You need all of them install as a global dependencies
so that development scripts can run correctly
```
npm install -g elm elm-format create-elm-app
```

## Environment Variables

*Note: Sorry for long name but `create-elm-app` need `ELM_APP` prefixed name
to make it available inside NodeJS environment.*

- ELM_APP_SPOTIFY_CLIENT_ID Spotify client ID
- ELM_APP_SPOTIFY_SECRET Spotify client secret

## Local Development Server
To run your local development server:

```
ELM_APP_SPOTIFY_CLIENT_ID=<Spotify client ID> \
ELM_APP_SPOTIFY_SECRET=<Spotify client secret> \
elm-app start
```

## Production Build
To build the assets for production deployment, run `build` script:

```
ELM_APP_SPOTIFY_CLIENT_ID=<Spotify client ID> \
ELM_APP_SPOTIFY_SECRET=<Spotify client secret> \
elm-app build
```