/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import { css, StyleSheet } from 'aphrodite';
import { Container } from 'react-grid-system';
import Navigation from '../components/Navigation';
import Banner from '../components/Banner';
import InfoSection from '../components/InfoSection';
import Strings from '../static/strings';
import Images from '../static/images';

const styles = StyleSheet.create({
    content: {
        marginBottom: '100px',
    }
});

class Landing extends React.Component {
    render() {
        return (
            <div className={css(styles.content)}>
                <Navigation/>
                <Banner/>
                <Container>
                     <InfoSection className={css(styles.infoSection)}
                         text={Strings.section_1_text}
                         img={Images.stock_graph}
                         text_first={true}/>
                     <InfoSection className={css(styles.infoSection)}
                                  text={Strings.section_2_text}
                         img={Images.email}
                         text_first={false}/>
                     <InfoSection className={css(styles.infoSection)}
                                  text={Strings.section_3_text}
                         img={Images.newspaper}
                         text_first={true} />
                </Container>
            </div>

        );
    }
}

export default Landing;