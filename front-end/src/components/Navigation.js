/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import {Link} from 'react-router-dom';
import { Navbar, Nav, NavItem } from 'react-bootstrap';
import { css, StyleSheet } from 'aphrodite';
import Colors from '../static/colors';


const styles = StyleSheet.create({
    nav: {
        background: Colors.primary,
        borderWidth: '0',
    },

    link: {
        color: 'white',
        textDecoration: 'none',
        ':hover': {
            color: 'black',
            textDecoration: 'none',
        }
    }

});

class Navigation extends React.Component {

    render() {
        return (
            <Navbar inverse collapseOnSelect fixedTop className={css(styles.nav)}>
                <Navbar.Header>
                    <Navbar.Brand>
                        <Link to="/" className={(css(styles.link))}>
                            Coinwatch
                        </Link>
                    </Navbar.Brand>
                    <Navbar.Toggle />
                </Navbar.Header>
                <Navbar.Collapse>

                    <Nav pullRight>
                        <NavItem>
                                <Link to="/demo" className={css(styles.link)}>
                                    Demo
                                </Link>
                        </NavItem>
                        <NavItem>
                            <Link to="/" className={css(styles.link)}>
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