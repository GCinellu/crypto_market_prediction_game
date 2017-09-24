import React from 'react';
import { connect } from 'react-redux';
import { push } from 'react-router-redux'

import { fetchLogin } from "../../../actions/login";

class LoginForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: '',
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
      .dispatch(fetchLogin(this.state))
      .then((action) => {
        if (action.error) return false;

        this.props.dispatch(push('/dashboard'));
      });
  }

  render() {
    return(
        <div className="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
          <form className="form-inline" onSubmit={ this.onSubmit }>
            <input
                className="form-control mr-sm-2"
                type="email"
                placeholder="Email"
                aria-label="Password"
                onChange={event => this.onChange(event, 'email')}
            />

            <input
                className="form-control mr-sm-2"
                type="password"
                placeholder="Password"
                aria-label="Password"
                onChange={event => this.onChange(event, 'password')}
            />

            <button  className="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
          </form>
        </div>
    )
  }
};

export default connect()(LoginForm);