import { Card, Icon, Label, Image, Button } from 'semantic-ui-react';
import moment from 'moment'
import { Link } from 'react-router-dom';

const PostCard = ({ post: { body, username, createdAt, likeCount, commentCount, likes, id } }) => {

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
            <Button as='div' labelPosition='right' onClick={likePost}>
                <Button color='teal' basic><Icon name='heart' /></Button>
                <Label as='a' basic color='teal' pointing='left'>{likeCount}</Label>
            </Button>
            <Button as='div' labelPosition='right' onClick={()=> console.log("comment")}>
                <Button color='blue' basic><Icon name='comments' /></Button>
                <Label as='a' basic color='blue' pointing='left'>{commentCount}</Label>
            </Button>
            </Card.Content>
        </Card>
    );
}

export default PostCard;