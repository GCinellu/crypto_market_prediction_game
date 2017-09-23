import React from 'react';
import Dropdown from './dropdown';
import LoginForm from './login-form';

export default ({ title }) => (
    <nav className="navbar navbar-expand-md navbar-light bg-light">
      <a className="navbar-brand" href="#">Oh Jeez Man</a>

      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon" />
      </button>

      <LoginForm />
    </nav>
);
