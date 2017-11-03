/**
 * Created by connor on 11/2/17.
 */
import React from 'react';
import { Row, Col, Panel, ListGroup, ListGroupItem } from 'react-bootstrap';
import { css, StyleSheet } from 'aphrodite';

const styles = StyleSheet.create({
    header: {
      textAlign: 'center',
      margin: 'auto',
    },

    exchange: {
        textAlign: 'left',
        display: 'inline'
    },

    rate: {
        textAlign: 'right',
        display: 'inline'
    }
});

class MarketCard extends React.Component {
    render() {
        return (
          <Panel collapsible defaultExpanded
                 header={this.props.pair.toUpperCase()} className={css(styles.header)}>
            <ListGroup>
                {this.props.exchangeData.map(exRate => {
                    return (
                        <ListGroupItem>
                            <Row>
                                <Col md={6} className={css(styles.exchange)}>
                                    {exRate['exchange'] + ':'}
                                </Col>
                                <Col md={6} className={css(styles.rate)}>
                                    {exRate['rate']}
                                </Col>
                            </Row>
                        </ListGroupItem>
                    );
                })}
            </ListGroup>
          </Panel>

        );
    }
}

export default MarketCard;