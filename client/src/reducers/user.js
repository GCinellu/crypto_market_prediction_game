const initialState = {
  isDefaultState: true,
  isFetching: false,
  isRejected: false,

  user: {}
};

export default (state = initialState, action) => {
  switch (action.type) {
    case 'REQUEST_LOGIN':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: true,
        isRejected: false,
      });

    case 'RECEIVE_LOGIN':
      return Object.assign({}, {
        isDefaultState: false,
        isFetching: false,
        isRejected: false,

        user: action.user
      });

    case 'REJECT_LOGIN':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: false,
        isRejected: true,

        error: action.error
      });

    case 'REQUEST_SIGNUP':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: true,
        isRejected: false,
      });

    case 'RECEIVE_SIGNUP':
      return Object.assign({}, {
        isDefaultState: false,
        isFetching: false,
        isRejected: false,

        user: action.user
      });

    case 'REJECT_SIGNUP':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: false,
        isRejected: true,

        error: action.error
      });

    default:
      return state;
  }
};
