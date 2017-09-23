import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import todos from './todos';
import user from './user'

import { localeReducer as locale } from 'react-localize-redux';

export default combineReducers({
  todos,
  user,
  locale,
  routing: routerReducer
});
