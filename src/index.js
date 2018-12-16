import './main.css';
import { Elm } from './Main.elm';
// import registerServiceWorker from './registerServiceWorker';

Elm.Main.init({
  node: document.getElementById('root'),
  flags: {
    spotifyClientId: process.env.ELM_APP_SPOTIFY_CLIENT_ID
  }
});

// registerServiceWorker();
