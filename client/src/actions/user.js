export const userFromSession = (user) => {
  return {
    type: 'USER_FROM_SESSION',
    user: user
  }
};