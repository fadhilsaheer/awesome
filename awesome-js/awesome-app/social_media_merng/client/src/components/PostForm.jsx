import { Button, Form } from 'semantic-ui-react';
import { useForm } from '../utils/hook';
import { useMutation } from '@apollo/client';
import { FETCH_QUERY_POST } from '../utils/graphql';

import gql from 'graphql-tag';

const PostForm = () => {

    const { onChange, onSubmit, values } = useForm(createPostCallback, {
        body: ''
    })

    const [createPost, { error }] = useMutation(CREATE_POST_MUTATION, {
        variables: values,
        update(proxy, result) {
            const data = proxy.readQuery({
                query: FETCH_QUERY_POST,
            });

            let tempData = {
                ...data,
                getPosts: [result.data.createPost, ...data.getPosts]
            }
            proxy.writeQuery({ query: FETCH_QUERY_POST, data: tempData });

            values.body = ''
        },
        onError(){
            console.log("error")
        }
    });

    function createPostCallback() {
        createPost();
    }

    return (
        <>
            <Form onSubmit={onSubmit}>
                <h2>Create a post:</h2>
                <Form.Field>
                    <Form.Input
                        placeholder="Hi world !"
                        name="body"
                        value={values.body}
                        onChange={onChange}
                        error={error ? true : false}
                    />
                    <Button type="submit" color="teal">Create</Button>
                </Form.Field>
            </Form>
            {error && (
                <div className="ui error message" style={{ marginBottom: 20 }}>
                    <ul className="list">
                        <li>{error.graphQLErrors[0].message}</li>
                    </ul>
                </div>
            )}
        </>
    );
}

const CREATE_POST_MUTATION = gql`
    mutation createPost($body: String!){
        createPost(body: $body){
            id
            body
            createdAt
            username
            likeCount
            commentCount
            likes{
                username
                id
            }
            comments{
                username
                createdAt
                id
            }
        }
    }
`

export default PostForm;