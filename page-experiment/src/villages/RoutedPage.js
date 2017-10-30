/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import {Link} from 'react-router-dom';

class RoutedPage extends React.Component {
    render() {
        return (
            <div classNam="routed-page">
                <h1>Success</h1>
                <Link to="/">
                    Go back to landing page
                </Link>
            </div>
        )
    }
}

export default RoutedPage;