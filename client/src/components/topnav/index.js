import React from 'react';
import { Link } from 'react-router-dom';

import Dropdown from './dropdown';
import LoginForm from './login-form';

import { connect } from 'react-redux';

const handleAuthenticatedUser = (user) => {
  if (user.user.token) return <Dropdown />;

  return <LoginForm />
}

const TopNav = ({ user, title }) => (
    <nav className="navbar navbar-expand-md navbar-light bg-light">

      <Link to='/' >
        <span className="navbar-brand">Oh Jeez Man</span>
      </Link>

      <button
        className="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span className="navbar-toggler-icon" />
      </button>

      {handleAuthenticatedUser(user)}
    </nav>
);
const mapStateToProps = state => {
  const { user } = state;
  return { user };
};

export default connect(
    mapStateToProps
)(TopNav);