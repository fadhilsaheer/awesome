import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useMutation } from '@apollo/client';
import { Button, Label, Icon } from 'semantic-ui-react';
import gql from 'graphql-tag';

const LikeButton = ({ post: { id, likeCount, likes }, user }) => {
    const [liked, setLiked] = useState(false);

    useEffect(()=>{
        if(user && likes.find(like => like.username === user.username)){
            setLiked(true)
        }else{
            setLiked(false)
        }
    }, [user, likes]);

    const [likePost] = useMutation(LIKE_POST_MUTATION, {
        variables: { postId: id }
    });

    const likeButton = user ? (
        liked ? (
            <Button color='teal'><Icon name='heart' /></Button>
        ) : (
            <Button color='teal' basic><Icon name='heart' /></Button>
        )
    ) : (
        <Button color='teal' basic as={Link} to="/login"><Icon name='heart' /></Button>
    )

    return (
        <Button as='div' labelPosition='right' onClick={likePost}>
            {likeButton}
            <Label as='a' basic color='teal' pointing='left'>{likeCount}</Label>
        </Button>
    );
}

const LIKE_POST_MUTATION = gql`
    mutation likePost($postId: ID!){
        likePost(postId: $postId){
            id
            likes{
                id username
            }
            likeCount
        }
    }
`

export default LikeButton;