import { useContext } from 'react';
import { Card, Icon, Label, Image, Button } from 'semantic-ui-react';
import { Link } from 'react-router-dom';
import { AuthContext } from '../context/auth';

import moment from 'moment'
import LikeButton from './likeButton';

const PostCard = ({ post: { body, username, createdAt, likeCount, commentCount, likes, id } }) => {

    const { user } = useContext(AuthContext);

    const likePost = () => {
        console.log('liked')
    }


    return (
        <Card fluid>
            <Card.Content>
                <Image floated='right' size='mini' src='https://react.semantic-ui.com/images/avatar/large/molly.png' />
                <Card.Header>{username}</Card.Header>
                <Card.Meta as={Link} to={`/post/${id}`}>{moment(createdAt).fromNow(true)}</Card.Meta>
                <Card.Description>{body}</Card.Description>
            </Card.Content>
            <Card.Content extra>
            <LikeButton post={{ id, likes, likeCount }} user={user} />
            <Button as='div' labelPosition='right' as={Link} to={`/posts/${id}`}>
                <Button color='blue' basic><Icon name='comments' /></Button>
                <Label as='a' basic color='blue' pointing='left'>{commentCount}</Label>
            </Button>
            { user && user.username === username && (
                <Button as="div" color="red" onClick={likePost} floated="right">
                    <Icon name="trash" style={{ margin: 0 }} />
                </Button>
            )}
            </Card.Content>
        </Card>
    );
}

export default PostCard;