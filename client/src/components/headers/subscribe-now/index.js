import React from 'react';
import { connect } from 'react-redux';

import { fetchSignup } from "../../../actions/signup";

import SubscribeForm from './../../subscribe-form';

if(process.env.WEBPACK) require('./index.scss');

const handleSignup = (event, dispatch) => {
  event.preventDefault();

  console.log('event', event.target);

  const request = {
    "user": {
      "email": "2ssddsss24d@32.com",
      "password": "password",
      "username": "asadsdsdmarcops2uzo2"
    }
  };

  dispatch(fetchSignup(request));
};

const SubscribeNow = ({ dispatch, title, user }) => (
  <div className="container-fluid bg-info subscribe-now">
    <div className="container">

      <br/><br/><br/>

      <div className="row">
        <div className="col-sm-12 col-md-6">
          <h1>Keep track of your gut feelings</h1>
          <h2>be a better trader</h2>
        </div>

        <div className="col-sm 12 col-md-4">
          <SubscribeForm
            title="Subscribe now"
          />
        </div>
      </div>
      <br/><br/><br/>
    </div>
  </div>
);

export default connect((state) => {
  const { user } = state;
  return { user };
})(SubscribeNow);