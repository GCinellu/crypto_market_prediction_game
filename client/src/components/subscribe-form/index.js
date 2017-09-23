import React from 'react';
import { Link } from 'react-router-dom';

import { connect } from 'react-redux';
import { push } from 'react-router-redux'

import { fetchSignup } from "../../actions/signup";

class SubscribeForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: '',
      username: '',
      password: ''
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onChange(event, name) {
    event.preventDefault();
    let object = {};
    object[name] = event.target.value;

    this.setState(object);
  }

  onSubmit(event) {
    event.preventDefault();

    this.props
      .dispatch(fetchSignup({user: this.state}))
      .then((action) => {
        if (action.error) return false;

        this.props.dispatch(push('/dashboard'));
      });
  }

  sinupForm() {
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

  authenticatedContent() {
    return(
        <div>
          <h3 className="text-center">Welcome Back</h3>

          <Link to='/dashboard' >
            <button className="btn btn-success btn-lg btn-block" >
              Go to Dashboard
            </button>
          </Link>

        </div>
    )
  }

  render() {
    if(this.props.user.user.token) {
      return this.authenticatedContent();
    }

    return this.sinupForm();
  }
};

const mapStateToProps = state => {
  const { user } = state;

  return { user };
};

export default connect(
  mapStateToProps
)(SubscribeForm);