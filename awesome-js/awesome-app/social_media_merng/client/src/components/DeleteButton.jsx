import { useState } from 'react';
import { useMutation } from '@apollo/client';
import { Button, Icon, Confirm, Popup } from 'semantic-ui-react';
import { FETCH_QUERY_POST } from '../utils/graphql';

import gql from 'graphql-tag';

const DeleteButton = ({ postId, callback, commentId }) => {
    const [confirmOpen, setConfirmOpen] = useState(false);

    const mutation = commentId ? DELETE_COMMENT_MUTATION : DELETE_POST_MUTATION;

    const [deletePostOrComment] = useMutation(mutation, {
        variables: { postId, commentId },
        update(proxy) {
            setConfirmOpen(false);

            if (!commentId) {
                const data = proxy.readQuery({
                    query: FETCH_QUERY_POST,
                });
                let tempData = {
                    ...data,
                    getPosts: data.getPosts.filter(p => p.id !== postId)
                }
                proxy.writeQuery({ query: FETCH_QUERY_POST, data: tempData });
            }

            if (callback) {
                callback();
            }
        }
    });



    return (
        <>
            <Popup
                content={commentId ? 'Delete comment' : 'Delete post' }
                inverted
                trigger={
                    <Button as="div" color="red" floated="right" onClick={() => setConfirmOpen(true)}>
                        <Icon name="trash" style={{ margin: 0 }} />
                    </Button>
                }
            />
            <Confirm
                open={confirmOpen}
                onCancel={() => setConfirmOpen(false)}
                onConfirm={deletePostOrComment}
            />
        </>
    );
}

const DELETE_POST_MUTATION = gql`
    mutation deletePost($postId: ID!){
        deletePost(postId: $postId)
    }
`

const DELETE_COMMENT_MUTATION = gql`
    mutation deleteComment($postId: ID!, $commentId: ID!){
        deleteComment(postId: $postId, commentId: $commentId){
            id
            comments{
                id username createdAt body
            }
            commentCount
        }
    }
`

export default DeleteButton;