import fetch from 'isomorphic-fetch';

const requestSignup = () => {
  return {
    type: 'REQUEST_SIGNUP'
  }
};

const receiveSignup = (json) => {
  return {
    type: 'RECEIVE_SIGNUP',
    user: json
  };
};

const rejectSignup = (error) => {
  return {
    type: 'REJECT_SIGNUP',
    error
  };
};

export const fetchSignup = (credentials) => {
  return dispatch => {
    dispatch(requestSignup());

    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');

    const options = {
      method: 'POST',
      headers: headers,
      body: JSON.stringify(credentials),
    };

    return fetch(`http://localhost:3000/api/v1/signup`, options)
      .then( (res) => {
        return res.json();
      })
      .then(
          (response) => {
            if (response.token) return dispatch(receiveSignup(response));
            return dispatch(rejectSignup(response))
          }
      )
  };
}
