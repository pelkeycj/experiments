/**
 * Created by connor on 10/30/17.
 */

import React from 'react';
import { css, StyleSheet } from 'aphrodite';
import { Row, Col } from 'react-bootstrap';
import Navigation from "../components/Navigation";
import MarketMock from '../static/MarketMock';
import UserMock from '../static/UserMock';
import MarketCard from "../components/MarketCard";



const styles = StyleSheet.create({
   cardCol: {
       margin: 'auto',
   }
});

//TODO style
//TODO the data processing that is done here, should probably be done by the server?
class Demo extends React.Component {
    constructor() {
        super();
        this.state = {
            markets: MarketMock.data1,
            userFollowing: UserMock.defaultFollowing,
        }
    }

    process() {
        let marketsToShow = {};
        let marketsToHide = [];

        for (let i = 0; i < this.state.markets.length; i++) {
            let hide = true;

            let market = this.state.markets[i];
            for (let j = 0; j < this.state.userFollowing.length; j++) {
                let followed = this.state.userFollowing[j];
                if (followed['exchange'] === market['exchange']
                    && followed['pair'] === market['pair']) {
                    let exchange = market['exchange'];
                    let pair = market['pair'];
                    let rate = market['rate'];

                    // add to object
                    let exchanges = marketsToShow[pair];
                    if (!exchanges) {
                        exchanges = [];
                    }

                    exchanges.push({exchange: exchange, rate: rate});
                    marketsToShow[pair] = exchanges;

                    hide = false;
                    break;
                }
            }
            if (hide) {
                marketsToHide.push(market);
            }
        }

        return {show: marketsToShow, hide: marketsToHide};
    }

    createFormOptions(markets) {
        let options = [];
        markets.map((market) => {
            let info = market['exchange'] + ':' + market['pair'];
            options.push({value: info, label: info});
        });

        console.log(options);
        return options;
    }

    handleSelectChange(value) {
        this.setState({ value });
        console.log(value);
    }

    render() {
        let markets = this.process();
        let shownMarkets = markets['show'];
        let hiddenMarkets = markets['hide'];

        return (
            <div>
                <Navigation/>
                <div>
                    <h1 style={{marginTop: '100px'}}>Demo page coming soon.</h1>
                    <h3>TODOs: </h3>
                    <ul>
                        <li>create two sets of mock data to alternate between</li>
                        <li>display mock data using cards?</li>
                        <li>maintain a mock list of followed assetpairs so that they can be modified in demo?</li>
                    </ul>
                </div>


                <Row>
                    {/* For each shown market, create a Market */}
                    {Object.keys(shownMarkets).map(key => {
                        return (
                          <Col md={3} className={css(styles.cardCol)}>
                              <MarketCard pair={key} exchangeData={shownMarkets[key]} />
                          </Col>
                        );
                    })}
                </Row>
            </div>
        );
    }
}

export default Demo;