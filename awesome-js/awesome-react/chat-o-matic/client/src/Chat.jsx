import React from 'react';

import { ApolloClient, InMemoryCache, ApolloProvider, useQuery, gql } from '@apollo/client';
import { Container, Row, Col, FormInput, Button } from 'shards-react';

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
            {data.messages.map(({ id, user: messageUser, content }) => {
                const isMe = user === messageUser;

                return (
                    <div
                        style={{
                            display: 'flex',
                            justifyContent: isMe ? 'flex-end' : 'flex-start',
                            paddingBottom: '1em',
                        }}
                    >
                        {!isMe && (
                            <div
                                style={{
                                    height: 50,
                                    width: 50,
                                    marginRight: '0.5em',
                                    border: "2px solid #e5e6ea",
                                    borderRadius: 25,
                                    textAlign: "center",
                                    fontSize: "18pt",
                                    paddingTop: 5,
                                }}
                            >
                                {messageUser.slice(0, 2).toUpperCase()}
                            </div>
                        )}
                        <div
                            style={{
                                background: isMe ? '#58bf56' : '#e5e6ea',
                                color: isMe ? 'white' : 'black',
                                padding: '1em',
                                borderRadius: '1em',
                                maxWidth: '60%',
                            }}
                        >
                            {content}
                        </div>
                    </div>
                );
            })}
        </>
    );
}

const Chat = () => {
    const [chat, setChat] = React.useState({
        user: 'me',
        content: ''
    });

    return (
        <Container><Messages user="me" /></Container>
    );
}

export default () => (
    <ApolloProvider client={client}>
        <Chat />
    </ApolloProvider>
)