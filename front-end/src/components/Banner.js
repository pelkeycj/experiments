/**
 * Created by connor on 11/1/17.
 */
import React from 'react';
import { css, StyleSheet } from 'aphrodite';
import { Link } from 'react-router-dom';
import { Button } from 'react-bootstrap';
import Colors from '../static/colors';
import Strings from '../static/strings';


//TODO probably want to change font used, maybe change primary/secondary colors
const styles = StyleSheet.create({
   section: {
    background: Colors.primary,
    width: '100%',
    height: '600px',
    borderWidth: '0',
    position: 'relative',
   },

   callToAction: {
       position: 'absolute',
       top: '0',
       bottom: '0',
       left: '0',
       right: '0',
       width: '35%',
       height: '30%',
       margin: 'auto',
       textAlign: 'center',
   },

   text: {
       color: 'white',
   },

   button: {
       borderRadius: '50px',
       marginTop: '10px',

       background: Colors.secondary,
       color: 'black',
       borderWidth: '0',
       fontWeight: 'bold',


       ':hover': {
           background: Colors.secondary_muted,
       }
   }
});



// this should be a large purple div containing a call to action and a 'get-started' button
// TODO for now, get-started will do nothing, the demo link is the main feature of this experiment
class Banner extends React.Component {
    render() {
        return (
            <div className={css(styles.section)}>
                <div className={css(styles.callToAction)}>
                    <h1 className={css(styles.text)}>Coinwatch</h1>
                    <h3 className={css(styles.text)}> { Strings.call_to_action_banner } </h3>
                    <Link to="/">
                        <Button  className={css(styles.button)}> Get Started </Button>
                    </Link>
                </div>
            </div>
        );
    }
}

export default Banner;