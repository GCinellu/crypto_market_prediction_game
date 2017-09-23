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

    const url = `http://localhost:3000/api/v1/login`;

    console.log(`[INFO] Call to ${url} from fetchLogin action`);

    return fetch(url, { method: 'POST', body: credentials })
        .then( (res) => {
          console.log('res', res);
          return res.json();
        } )
        .then(
            response => dispatch(receiveLogin(response)),
            error => dispatch(rejectLogin(error))
        );
  };
}
