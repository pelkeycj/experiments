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
       display: 'inline-flex',
       paddingTop: '50px',
       paddingLeft: '100px',
       paddingRight: '100px',
   }
});

//TODO style
//TODO the data processing that is done here, should probably be done by the server?
class Demo extends React.Component {
    constructor() {
        super();
        this.state = {
            markets: MarketMock.data1,
            mockData: 'data1',
            userFollowing: UserMock.defaultFollowing,
            lastUpdate: Date.now()
        };
       // this.toggleMockData = this.bind(this);
        this.toggleMockData = this.toggleMockData.bind(this);
        setInterval(this.toggleMockData, 5000);
    }

    toggleMockData() {
        let now = Date.now();
        console.log(now);
        if ((now - this.state.lastUpdate) > 4000) {
            let newData;
            let newMock;
            if (this.state.mockData === 'data1') {
                newData = MarketMock.data2;
                newMock = 'data2';
            }
            else {
                newData = MarketMock.data1;
                newMock = 'data1';
            }
            this.setState({lastUpdate: now, markets: newData, mockData: newMock})
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

    render() {
        this.toggleMockData();
        console.log(this.state.mockData);
        let markets = this.process();
        let shownMarkets = markets['show'];
        let hiddenMarkets = markets['hide'];

        return (
            <div>
                <Navigation/>
                <div style={{marginLeft: '50px'}}>
                    <h1 style={{marginTop: '70px'}}>Watching (demo)</h1>
                    <p>The values of the watched markets change every 5 seconds with mock data</p>
                </div>


                <div>
                    {/* For each shown market, create a Market */}
                    {Object.keys(shownMarkets).map(key => {
                        return (
                          <div className={css(styles.cardCol)}>
                              <MarketCard pair={key} exchangeData={shownMarkets[key]} />
                          </div>
                        );
                    })}
                </div>
            </div>
        );
    }
}

export default Demo;