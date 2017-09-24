import fetch from 'isomorphic-fetch';

function requestLogin() {
  return {
    type: 'REQUEST_LOGIN'
  }
}

export function receiveLogin(json) {
  return {
    type: 'RECEIVE_LOGIN',
    user: json
  };
}

function rejectLogin(error) {
  return {
    type: 'REJECT_LOGIN',
    error
  };
}

export const fetchLogin = (credentials) => {
  return dispatch => {
    dispatch(requestLogin());

    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');

    const options = {
      method: 'POST',
      headers: headers,
      body: JSON.stringify(credentials),
    };

    return fetch(`http://localhost:3000/api/v1/login`, options)
        .then( (res) => {
          return res.json();
        })
        .then(
            (response) => {
              if (response.token) return dispatch(receiveLogin(response));
              return dispatch(rejectLogin(response))
            }
        )
  };
}
