import React, { Component } from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import Landing from './containers/Landing';
import Demo from './containers/Demo';

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <Switch>
          <Route exact path="/" component={Landing} />
          <Route exact path="/demo" component={Demo} />
        </Switch>
      </BrowserRouter>
    );
  }
}

export default App;
