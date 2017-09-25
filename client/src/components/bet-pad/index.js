import React from 'react';
import { connect } from 'react-redux';

import {fetchPredicteds} from "../../actions/predicteds";

class BetPad extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      betDirection: ''
    }

    this.handleBetDirection = this.handleBetDirection.bind(this);
  }

  handleBetDirection(event) {
    event.preventDefault();

    const betDirection = event.target.attributes['data-bet-direction'].value;

    console.log('betDirection', betDirection);
    this.setState({ betDirection });
  }



  render() {
    return(
      <div className="card bet-pad">
        <div className="card-block">
          <h4 className="card-title">So you read the future?</h4>
          <hr/>
          <h6 className="card-subtitle mb-2 text-muted text-center">Is it going up or down?</h6>

          <div className="row">
            <div className="col-sm-6">
              <button
                  className={`btn btn-lg btn-block ${this.state.betDirection === 'down' ? 'btn-danger' : 'btn-outline-danger'}`}
                  data-bet-direction="down"
                  onClick={this.handleBetDirection}
              >
                Down
              </button>
            </div>
            <div className="col-sm-6">
              <button
                  className={`btn btn-lg btn-block ${this.state.betDirection === 'up' ? 'btn-success' : 'btn-outline-success'}`}
                  data-bet-direction="up"
                  onClick={this.handleBetDirection}
              >
                Up
              </button>
            </div>
          </div>
          <br/>

          <h6 className="card-subtitle mb-2 text-muted text-center">How much?</h6>
          <div className="row">
            <div className="col-sm-12">
              <div className="input-group">
                <input type="text" className="form-control" aria-label="Text input with dropdown button" />
                <div className="input-group-btn">
                  <button type="button" className="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Absolute
                  </button>

                  <div className="dropdown-menu dropdown-menu-right">
                    <a className="dropdown-item" href="#">Relative</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <br/>

          <h6 className="card-subtitle mb-2 text-muted text-center">In how long?</h6>
          <div className="row">
            <div className="col-sm-7">
              <div className="input-group">
                <input type="date" className="form-control" aria-label="Text input with dropdown button" />
              </div>
            </div>

            <div className="col-sm-5">
              <div className="input-group">
                <input type="time" className="form-control" aria-label="Text input with dropdown button" />
              </div>
            </div>
          </div>

          <hr/>

          <div className="row">
            <div className="col-sm-12">
              <button className="btn btn-lg btn-block btn-warning">Bet now</button>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default connect((state) => {
  const { user } = state;
  return { user: user.user };
})(BetPad);
