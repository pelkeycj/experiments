/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import Navigation from "../components/Navigation";

class Demo extends React.Component {
    render() {
        return (
            <div>
                <Navigation/>
                <div>
                    <h1 style={{marginTop: '100px'}}>Demo page coming soon.</h1>
                    <h3>TODOs: </h3>
                    <ul>
                        <li>create two sets of mock data to alternate between</li>
                        <li>display mock data using cards?</li>
                        <li>maintain a mock list of followed assetpairs so that they can be modified in demo?</li>
                    </ul>
                </div>
            </div>
        );
    }
}

export default Demo;