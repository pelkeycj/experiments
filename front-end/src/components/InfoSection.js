/**
 * Created by connor on 11/2/17.
 */

import React from 'react';
import { css, StyleSheet } from 'aphrodite';
import { Image } from 'react-bootstrap';
import { Row, Col } from 'react-grid-system';


const styles = StyleSheet.create({
    section: {
        height: '400px',
        textAlign: 'center',
        position: 'relative',
    },

    centerContentsVertical: {

    },

    textBox: {
        position: 'absolute',
        top: '0',
        bottom: '0',
        left: '0',
        right: '0',
        width: '80%',
        height: '50%',
        marginTop: 'auto',
        margin: 'auto',
        textAlign: 'left',
        padding: '10%',
    },

    imageBox: {
        position: 'absolute',
        top: '0',
        bottom: '0',
        left: '0',
        right: '0',
        width: '90%',
        height: '90%',

    }

});

// Render a text blurb and image side by side
class InfoSection extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        let text = (
            <Col md={6} className={css(styles.centerContentsVertical)}>
                <div className={css(styles.textBox)}>
                    <h2>{this.props.text}</h2>
                </div>
            </Col>
        );

        let image = (
            <Col md={6} className={css(styles.centerContentsVertical)} >
                <div className={css(styles.textBox)}>
                    <Image src={this.props.img} responsive />
                </div>
            </Col>
        );

        if (this.props.text_first) {
            return (
                <Row className={css(styles.section)}>
                    { text }
                    { image }
                </Row>
            );
        }

        return (
            <Row className={css(styles.section)}>
                { image }
                { text }
            </Row>
        );
    }

}

export default InfoSection;
