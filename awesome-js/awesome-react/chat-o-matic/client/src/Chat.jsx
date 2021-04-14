import React from 'react';

import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';

const client = new ApolloClient({
    uri: 'http://localhost:4000/',
    cache: new InMemoryCache()
});

const Chat = () => {
    return (
        <div>Hello i'm chat</div>
    );
}

export default () => (
    <ApolloProvider client={client}>
        <Chat />
    </ApolloProvider>
)