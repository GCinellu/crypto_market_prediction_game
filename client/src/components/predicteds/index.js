import React from 'react';
import { connect } from 'react-redux';

import {fetchPredicteds} from "../../actions/predicteds";

class Predicteds extends React.Component {
  constructor(props) {
    super(props);
  }

  componentWillMount() {
    this.props.dispatch(fetchPredicteds(this.props.user.user))
  }


  render() {
    const predicteds = this.props.predicteds.predicteds;

    if (!predicteds.length) return false;

    return(
      <table className="table">
        <thead className="thead-inverse">
        <tr>
          <th>#</th>
          <th>Coin</th>
          <th>Exchange</th>
          <th>Currency</th>
          <th>Prediction Type</th>
          <th>Change Predicted</th>
          <th>Value at time</th>
          <th>Value at expiration</th>
          <th>Expiration Time</th>
          <th>Current Difference</th>
        </tr>
        
        </thead>
        <tbody key>
        {predicteds.map((prediction, index) => {
          return(
            <tr key={index}>
              <th scope="row">{index + 1}</th>
              <td>{prediction.coin}</td>
              <td>{prediction.exchange}</td>
              <td>{prediction.currency}</td>
              <td>{prediction.prediction_type}</td>
              <td>{prediction.change_in_price}</td>
              <td>{prediction.value_at_time}</td>
              <td>{prediction.value_at_expiration}</td>
              <td>{prediction.expired_at}</td>
              <td>{prediction.change}</td>
            </tr>
          )
        })}
        </tbody>
      </table>
    );
  }
}

export default connect((state) => {
  const { user, predicteds } = state;
  return { user, predicteds };
})(Predicteds);
