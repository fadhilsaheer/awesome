import React from 'react';

import { ApolloClient, InMemoryCache, ApolloProvider, useQuery, gql } from '@apollo/client';
import { Container } from 'shards-react';

const client = new ApolloClient({
    uri: 'http://localhost:4000/',
    cache: new InMemoryCache()
});

const getMessages = gql`
    query{
        messages{
            id
            content
            user
        }
    }
`

const Messages = ({ user }) => {
    const { data } = useQuery(getMessages);
    if (!data) {
        return null;
    }

    return (
        <>
            {data.messages.map(({ id, user: messageUser, content }) => (
                <div
                    style={{
                        display: 'flex',
                        justifyContent: messageUser === user ? 'flex-end' : 'flex-start',
                        paddingBottom: '1em',
                    }}
                >

                </div>
            ))}
        </>
    );
}

const Chat = () => {
    return (
        <Container><Messages user="awesome" /></Container>
    );
}

export default () => (
    <ApolloProvider client={client}>
        <Chat />
    </ApolloProvider>
)