/**
 * Created by connor on 10/30/17.
 */
import React from 'react';
import { Container, Row, Col } from 'react-grid-system';
import {Link} from 'react-router-dom';

class Navigation extends React.Component {
    render() {
        return (
            <Container>
                <Row>
                    <Col lg={6}>
                        <Link to="/yay">
                            <span className="route-link">
                                ROUTE ME!
                            </span>
                        </Link>
                    </Col>
                </Row>
            </Container>
        );
    }
}

export default Navigation;