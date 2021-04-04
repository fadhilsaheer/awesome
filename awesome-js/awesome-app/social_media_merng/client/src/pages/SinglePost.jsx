import { useContext, useState, useRef } from 'react';
import { useQuery, useMutation } from '@apollo/client';
import { Grid, Image, Card, Button, Icon, Label, Form } from 'semantic-ui-react';
import { AuthContext } from '../context/auth';

import gql from 'graphql-tag';
import moment from 'moment';
import LikeButton from '../components/likeButton';
import DeleteButton from '../components/DeleteButton';

const SinglePost = (props) => {
    const { user } = useContext(AuthContext);
    const postId = props.match.params.postId;
    const commentInputRef = useRef(null)

    const [comment, setComment] = useState('');

    const { data } = useQuery(FETCH_POST_QUERY, {
        variables: { postId }
    })
    const post = data?.getPost;

    const [sumbitComment] = useMutation(CREATE_COMMENT_MUTATION, {
        update() {
            setComment('');
            commentInputRef.current.blur();
        },
        variables: { postId, body: comment }
    })

    let postMarkup;
    if (!post) {
        postMarkup = <p>Loading post..</p>
    } else {
        const { id, body, createdAt, username, likeCount, commentCount, comments, likes } = post;

        postMarkup = (
            <Grid>
                <Grid.Row>
                    <Grid.Column width={2}>
                        <Image src='https://react.semantic-ui.com/images/avatar/large/molly.png' size="small" float="right" />
                    </Grid.Column>
                    <Grid.Column width={10}>
                        <Card fluid>
                            <Card.Content>
                                <Card.Header>{username}</Card.Header>
                                <Card.Meta>{moment(createdAt).fromNow()}</Card.Meta>
                                <Card.Description>{body}</Card.Description>
                            </Card.Content>
                            <hr />
                            <Card.Content extra>
                                <LikeButton post={{ id, likeCount, likes }} user={user} />
                                <Button as="div" labelPosition="right">
                                    <Button basic color="blue"><Icon name="comments" /></Button>
                                    <Label basic color="blue" pointing="left">{commentCount}</Label>
                                </Button>
                                {user && user.username === username && <DeleteButton postId={id} callback={() => props.history.push('/')} />}
                            </Card.Content>
                        </Card>
                        {user && (
                            <Card fluid>
                                <Card.Content>
                                    <p>Rock a comment</p>
                                    <Form>
                                        <div className="ui action input fluid">
                                            <input
                                                type="text"
                                                placeholder="Comment.."
                                                name="comment"
                                                value={comment}
                                                onChange={event => setComment(event.target.value)}
                                                ref={commentInputRef}
                                            />
                                            <button
                                                type="submit"
                                                className="ui button teal"
                                                disabled={comment.trim() === ''}
                                                onClick={sumbitComment}
                                            >Comment</button>
                                        </div>
                                    </Form>
                                </Card.Content>
                            </Card>
                        )}
                        {comments.map(comment => (
                            <Card fluid key={comment.id}>
                                <Card.Content>
                                    {user && user.username === comment.username && (
                                        <DeleteButton postId={id} commentId={comment.id} />
                                    )}
                                    <Card.Header>{comment.username}</Card.Header>
                                    <Card.Meta>{moment(comment.createdAt).fromNow()}</Card.Meta>
                                    <Card.Description>{comment.body}</Card.Description>
                                </Card.Content>
                            </Card>
                        ))}
                    </Grid.Column>
                </Grid.Row>
            </Grid>
        );

    }

    return postMarkup;
}

const FETCH_POST_QUERY = gql`
    query($postId: ID!){
        getPost(postId: $postId){
            id body createdAt username likeCount commentCount
            likes{
                username
            }
            comments{
                username
                body
                createdAt
                id
            }
        }
    }
`

const CREATE_COMMENT_MUTATION = gql`
    mutation($postId: String!, $body: String!){
        createComment(postId: $postId, body: $body){
            id
            comments{
                id
                body
                username
                createdAt
            }
            commentCount
        }
    }
`

export default SinglePost;