/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import Navigation from '../components/Navigation';
import Banner from '../components/Banner';
import InfoSection from './InfoSection';
import Strings from '../static/strings';
import Images from '../static/images';


class Landing extends React.Component {
    render() {
        return (
            <div>
                <Navigation/>
                <Banner/>
                <InfoSection text={Strings.section_1_text}
                             img={Images.stock_graph}
                             text_first={true}/>
                <InfoSection text={Strings.section_2_text}
                             img={Images.email}
                             text_first={false}/>
                <InfoSection text={Strings.section_3_text}
                             img={Images.newspaper}
                             text_first={true} />
            </div>
            // Landing Navigation
            // Banner
            // SectionB

        );
    }
}

export default Landing;