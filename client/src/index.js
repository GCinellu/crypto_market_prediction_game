import React from 'react';
import { render } from 'react-dom';
import { createBrowserHistory } from 'history';
import { ConnectedRouter, routerMiddleware } from 'react-router-redux';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware, compose } from 'redux';
import App from './components/app';
import reducers from './reducers';
import { initialize } from 'react-localize-redux';

import { userFromSession } from "./actions/user";

import { createLogger } from 'redux-logger';
import thunk from 'redux-thunk';

const history = createBrowserHistory();

const loggerMiddleware = createLogger();

const store = createStore(
    reducers,
    compose(
        applyMiddleware(
            thunk,
            loggerMiddleware,
            routerMiddleware(history),
        )
    )
);

const languages = ['en', 'it'];
store.dispatch(initialize(languages, { defaultLanguage: 'en' }));

const userObject = sessionStorage.getItem('userObject');
if (userObject) {
  store.dispatch(userFromSession(JSON.parse(userObject)))
}

render(
    <Provider store={store}>
      <ConnectedRouter history={history}>
        <App />
      </ConnectedRouter>
    </Provider>
    , document.getElementById('app'));

if(process.env.NODE_ENV === 'development' && module.hot) {
  module.hot.accept();
  module.hot.accept('./reducers', () => {
    store.replaceReducer(require('./reducers').default);
  });
}
