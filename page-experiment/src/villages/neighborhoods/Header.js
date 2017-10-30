/**
 * Created by connor on 10/30/17.
 */
import React from 'react';
import ReactDOM from 'react-dom';
import { Container, Row, Col } from 'react-grid-system';
import Navigation from "./blocks/Navigation";
import TitleSection from "./blocks/TitleSection";

class Header extends React.Component {
    render() {
        return (
            <section className="header">
                <Container>
                    <Row>
                        <Navigation/>
                    </Row>
                    <Row>
                        <TitleSection/>
                    </Row>
                </Container>
            </section>
        );
    }
}

export default Header;