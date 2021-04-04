import { useState } from 'react';
import { useMutation } from '@apollo/client';
import { Button, Icon, Confirm } from 'semantic-ui-react';
import { FETCH_QUERY_POST } from '../utils/graphql';

import gql from 'graphql-tag';

const DeleteButton = ({ postId, callback }) => {
    const [confirmOpen, setConfirmOpen] = useState(false);

    const [deletePost] = useMutation(DELETE_POST_MUTATION, {
        variables: { postId },
        update(proxy) {
            setConfirmOpen(false);

            const data = proxy.readQuery({
                query: FETCH_QUERY_POST,
            });
            let tempData = {
                ...data,
                getPosts: data.getPosts.filter(p => p.id !== postId)
            }
            proxy.writeQuery({ query: FETCH_QUERY_POST, data: tempData });

            if(callback){
                callback();
            }
        }
    });



    return (
        <>
            <Button as="div" color="red" floated="right" onClick={()=> setConfirmOpen(true)}>
                <Icon name="trash" style={{ margin: 0 }} />
            </Button>
            <Confirm 
                open={confirmOpen} 
                onCancel={()=> setConfirmOpen(false)}
                onConfirm={deletePost}
            />
        </>
    );
}

const DELETE_POST_MUTATION = gql`
    mutation deletePost($postId: ID!){
        deletePost(postId: $postId)
    }
`

export default DeleteButton;