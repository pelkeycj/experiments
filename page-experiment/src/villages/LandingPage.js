/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import ReactDOM from 'react-dom';
import Header from './neighborhoods/Header';
import SectionA from './neighborhoods/SectionA';

class LandingPage extends React.Component {
    render() {
        return (

            <div className="landing-page">
                <Header/>
                <SectionA/>
            </div>
        );
    }
}

export default LandingPage;