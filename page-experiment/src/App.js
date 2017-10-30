import React, { Component } from 'react';
import { Container, Row, Col } from 'react-grid-system';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import './App.css';
import LandingPage from "./villages/LandingPage";
import RoutedPage from "./villages/RoutedPage";

class App extends Component {
  render() {
    return (
        <Router>
          <div>
            <Route exact path="/" component={LandingPage}/>
            <Route exact path="/yay" component={RoutedPage}/>
          </div>
        </Router>
    );
  }
}

export default App;
