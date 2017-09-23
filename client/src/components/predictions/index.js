import React from 'react';
import { connect } from 'react-redux';

import { Link } from 'react-router-dom';

class Predictions extends React.Component {
  constructor(props) {
    super(props);

  }

  render() {
    return(
      <table className="table">
        <thead className="thead-inverse">
        <tr>
          <th>#</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob</td>
          <td>Thornton</td>
          <td>@fat</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Larry</td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>
        </tbody>
      </table>
    );
  }
}

export default connect((state) => {
  const { user } = state;
  return { user: user.user };
})(Predictions);
