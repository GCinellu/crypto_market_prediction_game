import React from 'react';
import { connect } from 'react-redux';

import { fetchSignup } from "../../actions/signup";

class SubscribeForm extends React.Component {
  constructor(props) {
    super(props);

    this.defaultState = {
      email: '',
      username: '',
      password: ''
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  state = this.defaultState;

  onChange(event, name) {
    event.preventDefault();
    let object = {};
    object[name] = event.target.value;

    this.setState(object);
  }

  onSubmit(event) {
    event.preventDefault();

    console.log('state', this.state);

    this.props.dispatch(fetchSignup({user: this.state}));
  }

  render() {
    return(
        <div>
          <h3 className="text-center">{this.props.title}</h3>

          <hr/>

          <form onSubmit={ this.onSubmit }>
            <div className="form-group">
              <input
                  type="text"
                  className="form-control"
                  id="signup-username"
                  aria-describedby="usernameHelp"
                  placeholder="Your username"
                  onChange={event => this.onChange(event, 'username')}
              />
            </div>

            <div className="form-group">
              <input
                  type="email"
                  className="form-control"
                  id="signup-email"
                  aria-describedby="emailHelp"
                  placeholder="Enter email"
                  onChange={event => this.onChange(event, 'email')}
              />
            </div>

            <div className="form-group">
              <input
                  type="password"
                  className="form-control"
                  id="exampleInputPassword1"
                  placeholder="Your new password"
                  onChange={event => this.onChange(event, 'password')}
              />
            </div>

            <button
                type="submit"
                className="btn btn-warning btn-lg btn-block"
            >
              Subscribe now
            </button>
          </form>
        </div>
    )
  }
};

const mapStateToProps = state => {
  const { user } = state;

  return { user };
};

export default connect(
  mapStateToProps
)(SubscribeForm);