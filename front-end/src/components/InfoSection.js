/**
 * Created by connor on 11/2/17.
 */

import React from 'react';
import { css, StyleSheet } from 'aphrodite';
import { Image, ResponsiveEmbed, Row, Col } from 'react-bootstrap';


const styles = StyleSheet.create({
    section: {
        height: "300px",
        textAlign: 'center',
        position: 'relative',
    },

    textBox: {
        position: 'absolute',
        top: '0',
        bottom: '0',
        left: '0',
        right: '0',
        width: '80%',
        height: '50%',
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
            <Col md={6}>
                <div className={css(styles.textBox)}>
                    <h2>{this.props.text}</h2>
                </div>
            </Col>
        );

        let image = (
            <Col md={6} >
                <div className={css(styles.textBox)}>
                    <Image src={this.props.img} responsive />
                </div>
		{/*
                <ResponsiveEmbed a16by9>
                    <embed type="image/svg+xml" src={this.props.img}/>
                </ResponsiveEmbed>
                

		
                <div className={css(styles.textBox)}>
                <h1>IMAGE HERE</h1>
                </div>
		*/}
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
