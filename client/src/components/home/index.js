import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { toggleTodo } from '../../actions/todos';


import TopNav from '../topnav';
import SubscribeNow from '../headers/subscribe-now';

if(process.env.WEBPACK) require('./index.scss');

const Home = () => (
  <div>
    <TopNav title='Oh Jeez Man' />
    <SubscribeNow />
  </div>
);

export default Home;
