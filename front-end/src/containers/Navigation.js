/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import {Link} from 'react-router-dom';


class Navigation extends React.Component {

    render() {
        return (
            <nav>
                <Link to="/">
                    <h1>Coinwatch</h1>
                </Link>
                <Link to="/demo">
                    demo
                </Link>
                <Link to="/signin">
                    Sign In
                </Link>
            </nav>
        );
    }
}

export default Navigation;