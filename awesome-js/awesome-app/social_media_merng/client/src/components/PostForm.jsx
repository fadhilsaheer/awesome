import { Button, Form } from 'semantic-ui-react';
import { useForm } from '../utils/hook';
import { useMutation } from '@apollo/client';

import gql from 'graphql-tag';

const PostForm = () => {

    const {onChange, onSubmit, values} = useForm(createPostCallback, {
        body: ''
    })

    const [createPost, { error }] = useMutation(CREATE_POST_MUTATION, {
        variables: values,
        update(_, result){
            console.log(result);
            values.body = ''
        }
    });

    function createPostCallback(){
        createPost();
    }

    return (
        <Form onSubmit={onSubmit}>
            <h2>Create a post:</h2>
            <Form.Field>
                <Form.Input 
                    placeholder="Hi world !"
                    name="body"
                    value={values.body}
                    onChange={onChange}
                />
                <Button type="submit" color="teal">Create</Button>
            </Form.Field>
        </Form>
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