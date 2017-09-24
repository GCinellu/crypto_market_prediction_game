import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import { toggleTodo } from './todos';

const middlewares = [thunk];
const mockStore = configureMockStore(middlewares);

describe('toggleTodo(id)', () => {
  it('should send an action with TOGGLE_TODO and the id', () => {
    const expectedActions = [
      { type: 'TOGGLE_TODO', id: 1 }
    ];

    const store = mockStore({});

    store.dispatch(toggleTodo(1));
    expect(store.getActions()).toEqual(expectedActions);
  });
});