/**
 * Created by connor on 10/26/17.
 */
import React from "react";

class Navbar extends React.Component {
    constructor() {
        super();
    }
    render() {
        return (
            <nav>
                <a href="#">Coinwatch</a>
                <a href="#">News</a>
                <a href="#">Markets</a>
                <a href="#">Profile</a>
                <a href="#">Logout</a>
            </nav>
        );
    }
}