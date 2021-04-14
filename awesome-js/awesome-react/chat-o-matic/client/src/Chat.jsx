import React from 'react';

import { ApolloClient, InMemoryCache, ApolloProvider, useQuery, gql, useMutation } from '@apollo/client';
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

const postMessageQuery = gql`
    mutation($user: String!, $content: String!){
        postMessage(user: $user, content: $content)
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
    const [state, setState] = React.useState({
        user: 'me',
        content: ''
    });


    const [postMessage] = useMutation(postMessageQuery);

    const sendMessage = () => {
        if (state.content.length > 0) {
            postMessage({
                variables: state,
            })
        }
        setState({
            ...state,
            content: "",
        })
    }

    return (
        <Container>
            <Messages user={state.user} />
            <Row>
                <Col xs={2} style={{ padding: 0 }}>
                    <FormInput
                        label='User'
                        value={state.user}
                        onChange={(e) => setState({
                            ...state,
                            user: e.target.value,
                        })}
                    />
                </Col>
                <Col xs={8}>
                    <FormInput
                        label='Content'
                        value={state.content}
                        onChange={(e) => setState({
                            ...state,
                            content: e.target.value,
                        })}
                        onKeyUp={(e) => {
                            if (e.keyCode === 13) {
                                sendMessage();
                            }
                        }}
                    />
                </Col>
                <Col xs={2}>
                    <Button onClick={() => sendMessage()}>
                        Send
                    </Button>
                </Col>
            </Row>
        </Container>
    );
}

export default () => (
    <ApolloProvider client={client}>
        <Chat />
    </ApolloProvider>
)