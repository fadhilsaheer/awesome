import { useContext } from 'react';
import { Card, Icon, Label, Image, Button, Popup } from 'semantic-ui-react';
import { Link, useHistory } from 'react-router-dom';
import { AuthContext } from '../context/auth';

import moment from 'moment'
import LikeButton from './likeButton';
import DeleteButton from './DeleteButton';

const PostCard = ({ post: { body, username, createdAt, likeCount, commentCount, likes, id } }) => {

    const { user } = useContext(AuthContext);

    const location = useHistory();


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
                <Popup
                    content="Comment on post"
                    inverted
                    trigger={
                        <Button as='div' labelPosition='right' onClick={() => location.push(`/posts/${id}`)}>
                            <Button color='blue' basic><Icon name='comments' /></Button>
                            <Label as='a' basic color='blue' pointing='left'>{commentCount}</Label>
                        </Button>
                    } />
                {user && user.username === username && <DeleteButton postId={id} />}
            </Card.Content>
        </Card>
    );
}

export default PostCard;