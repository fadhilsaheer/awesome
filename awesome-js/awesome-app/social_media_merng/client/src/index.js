import React from 'react';
import ReactDOM from 'react-dom';
import ApolloProvider from './ApolloProvider';

ReactDOM.render(
  <React.StrictMode>
    <ApolloProvider />
  </React.StrictMode>,
  document.getElementById('root')
);
