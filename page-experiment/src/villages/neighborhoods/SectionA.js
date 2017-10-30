/**
 * Created by connor on 10/30/17.
 */
import React from 'react';
import ReactDOM from 'react-dom';
import { Container, Row, Col } from 'react-grid-system';
import SectionDescription from './blocks/SectionDescription';
import Image from './blocks/houses/Image';

class SectionA extends React.Component {
    render() {
        return (
            <section className="section-a">
                <Container>
                    <Row>
                        <p>This is a React.js experiment to test basic app setup and routing functionality.</p>
                    </Row>
                </Container>
            </section>
        );
    }
}

export default SectionA;