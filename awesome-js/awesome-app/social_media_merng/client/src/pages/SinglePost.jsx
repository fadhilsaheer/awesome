import { useContext } from 'react';
import { useQuery } from '@apollo/client';
import { Grid, Image, Card, Button, Icon, Label } from 'semantic-ui-react';
import { AuthContext } from '../context/auth';

import gql from 'graphql-tag';
import moment from 'moment';
import LikeButton from '../components/likeButton';

const SinglePost = (props) => {
    const { user } = useContext(AuthContext);
    const postId = props.match.params.postId;


    const { data: { getPost } } = useQuery(FETCH_POST_QUERY, {
        variables: { postId }
    })

    let postMarkup;
    if (!getPost) {
        postMarkup = <p>Loading post..</p>
    } else {
        const { id, body, createdAt, username, likeCount, commentCount, comments, likes } = getPost;

        postMarkup = (
            <Grid>
                <Grid.Row>
                    <Grid.Column width={2}>
                        <Image src='https://react.semantic-ui.com/images/avatar/large/molly.png' size="small" float="right" />
                    </Grid.Column>
                    <Grid.Column width={10}>
                        <Card fluid>
                            <Card.Content>
                                <Card.Header>{ username }</Card.Header>
                                <Card.Meta>{ moment(createdAt).fromNow() }</Card.Meta>
                                <Card.Description>{ body }</Card.Description>
                            </Card.Content>
                            <hr />
                            <Card.Content extra>
                                <LikeButton post={{ id, likeCount, likes }} user={user} />
                                <Button as="div" labelPosition="right">
                                    <Button basic color="blue"><Icon name="comments" /></Button>
                                    <Label basic color="blue" pointing="left">{ commentCount }</Label>
                                </Button>
                            </Card.Content>
                        </Card>
                    </Grid.Column>
                </Grid.Row>
            </Grid>
        );
    }

    return (
        <h2>Single post</h2>
    );
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
            }
        }
    }
`

export default SinglePost;