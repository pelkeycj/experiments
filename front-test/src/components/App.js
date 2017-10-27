import React, { Component } from 'react';
import logo from '../logo.svg';
import '../style/App.css';
import './Navbar';

class App extends Component {
  render() {
    return ( // with bootstrap classname would be body?
      <div className="App">
          <Navbar />
      </div>
    );
  }
}

export default App;
