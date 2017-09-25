import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import nock from 'nock';
import { fetchLogin } from './login';

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);

const mockLoginRequest = {
  email: 'fedora@happypencil.com',
  password: 'svlatisvonisk'
};

const mockLoginResponse = {
  email: mockLoginRequest.email,
  username: 'master of fedoras',
  token: 'S0$3kr3T'
};

describe('fetchLogin(credentials)', () => {
  afterEach(() => {
    nock.cleanAll();
  });

  it('should dispatch RECEIVE_LOGIN when call is successfull', () => {
    nock(`http://localhost:3000/api/v1`)
        .post('/login', mockLoginRequest)
        .reply(202, mockLoginResponse);

    const expectedActions = [
      { type: 'REQUEST_LOGIN' },
      { type: 'RECEIVE_LOGIN', user: mockLoginResponse }
    ];

    const store = mockStore({ user: {} });

    return store.dispatch(fetchLogin(mockLoginRequest)).then((something) => {
      console.log('something', something);
      // return of async actions
      expect(store.getActions()).toEqual(expectedActions);
    });
  });

  it('should dispatch REJECT_LOGIN when call is not successfull', () => {
    const error = { error: 'Not today buddy!' };

    nock(`http://localhost:3000/api/v1`)
        .post('/login', mockLoginRequest)
        .reply(400, error);

    const expectedActions = [
      { type: 'REQUEST_LOGIN' },
      { type: 'REJECT_LOGIN', error: error }
    ];

    const store = mockStore({ user: {} });

    return store.dispatch(fetchLogin(mockLoginRequest)).then(() => {
      // return of async actions

      expect(store.getActions()).toEqual(expectedActions);
    });
  });
});