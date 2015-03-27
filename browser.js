import React from 'react'
global.React = React
import Router, { Route, DefaultRoute } from 'react-router'
import Actions from './actions'
// have to use require for bulkify
const bulk = require('bulk-require')

const views = bulk(__dirname + '/views/', ['**/*.js']);
const Index = views.index;
const Layout = views.layout;

const routes = (
  <Route handler={Layout} path='/'>
    <Route path='/messages' handler={views.messages} />
    <DefaultRoute handler={Index} />
  </Route>
);

Router.run(routes, (Handler) => {
  React.render(<Handler />, document.body);
});

