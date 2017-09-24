import React from 'react';
import { connect } from 'react-redux';

import {fetchPredictions} from "../../actions/predictions";

class Predictions extends React.Component {
  constructor(props) {
    super(props);
  }

  componentWillMount() {
    this.props.dispatch(fetchPredictions(this.props.user.user))
  }


  render() {
    const predictions = this.props.predictions.predictions;

    if (!predictions.length) return false;

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
          <th>Expiration Time</th>
          <th>Current Difference</th>
        </tr>
        
        </thead>
        <tbody>
        {predictions.map((prediction, index) => {
          return(
            <tr key={index}>
              <th scope="row">{index + 1}</th>
              <td>{prediction.coin}</td>
              <td>{prediction.exchange}</td>
              <td>{prediction.currency}</td>
              <td>{prediction.prediction_type}</td>
              <td>{prediction.change_in_price}</td>
              <td>{prediction.current_value}</td>
              <td>{prediction.expiring_at}</td>
              <td>{prediction.current_value}</td>
            </tr>
          )
        })}
        </tbody>
      </table>
    );
  }
}

export default connect((state) => {
  const { user, predictions } = state;
  return { user, predictions };
})(Predictions);
