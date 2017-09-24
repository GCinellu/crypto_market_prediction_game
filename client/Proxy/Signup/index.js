import fetch from 'isomorphic-fetch';

export default (req, res) => {
  const headers = new Headers();
  headers.append('Accept', 'application/json');
  headers.append('Content-Type', 'application/json');

  const options = {
    method: 'POST',
    headers: headers,
    body: JSON.stringify(req.body),
  };

  fetch('http://localhost:9000/authentication/signup', options)
    .then( res => res.json() )
    .then(
        (response) => {
          if (response.error) {
            return res.status(400).send(response); // Bad Request
          }
          res.status(201).send(response) // Created
        },
        (error) => {
          res.status(520).send(error) // Unknown Error
        }
    );
};
