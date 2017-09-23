import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Home from '../home';
import Dashboard from '../dashboard';
import NoMatch from '../nomatch';

export default () => (
  <Switch>
    <Route exact path='/' component={Home} />
    <Route path='/dashboard' component={Dashboard} />
    <Route component={NoMatch} />
  </Switch>
);

