import { useQuery } from '@apollo/client';
import { Grid } from 'semantic-ui-react';

import gql from 'graphql-tag';
import PostCard from '../components/PostCard';

const Home = () => {
    const { loading, data: { getPosts: posts } } = useQuery(FETCH_QUERY_POST);

    return (
        <Grid columns={3}>
            <Grid.Row>
                <h1>Recent Posts</h1>
            </Grid.Row>
            <Grid.Row>
                {loading ? (
                    <h2>Loading posts .....</h2>
                ) : (
                    posts && posts.map(post => (
                        <Grid.Column key={post.id} style={{ marginBottom: 20 }}>
                            <PostCard post={post} />
                        </Grid.Column>
                    ))
                )}
            </Grid.Row>
        </Grid>
    );
}

const FETCH_QUERY_POST = gql`
    {
        getPosts{
            id 
            body 
            createdAt 
            username 
            likeCount 
            commentCount
            likes{
                username
            }
            comments{
                username 
                body
                id
            }
        }
    }
`

export default Home;