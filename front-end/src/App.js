import React, { Component } from 'react';
import { BrowserRouter, Route } from 'react-router-dom';
import Landing from './containers/Landing';

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <Route path="/" component={Landing} />
      </BrowserRouter>
    );
  }
}

export default App;
