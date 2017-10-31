/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import {Link} from 'react-router-dom';
import { Navbar, Nav, NavItem, MenuItem, NavDropdown } from 'react-bootstrap';

//TODO styles
class Navigation extends React.Component {

    render() {
        return (
            <Navbar inverse collapseOnSelect fixedTop>
                <Navbar.Header>
                    <Navbar.Brand>
                        <Link to="/">
                            Coinwatch
                        </Link>
                    </Navbar.Brand>
                    <Navbar.Toggle />
                </Navbar.Header>
                <Navbar.Collapse>

                    <Nav pullRight>
                        <NavItem>
                                <Link to="/demo">
                                    Demo
                                </Link>
                        </NavItem>
                        <NavItem>
                            <Link to="/">
                                Sign In
                            </Link>
                        </NavItem>
                    </Nav>
                </Navbar.Collapse>
            </Navbar>
        );
    }
}

export default Navigation;