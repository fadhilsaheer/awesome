import { useContext } from 'react';
import { AuthContext } from '../context/auth';
import { useQuery } from '@apollo/client';
import { Grid, Transition } from 'semantic-ui-react';
import { FETCH_QUERY_POST } from '../utils/graphql';

import PostCard from '../components/PostCard';
import PostForm from '../components/PostForm';

const Home = () => {
    const { user } = useContext(AuthContext);
    const { loading, data } = useQuery(FETCH_QUERY_POST);
    const posts = data?.getPosts;

    return (
        <Grid columns={3}>
            <Grid.Row className="page-title">
                <h1>Recent Posts</h1>
            </Grid.Row>
            <Grid.Row>
                {user && (
                    <Grid.Column>
                        <PostForm />
                    </Grid.Column>
                )}
                {loading ? (
                    <h2>Loading posts .....</h2>
                ) : (
                    <Transition.Group>
                        {posts && posts.map(post => (
                            <Grid.Column key={post.id} style={{ marginBottom: 20 }}>
                                <PostCard post={post} />
                            </Grid.Column>
                        ))}
                    </Transition.Group>
                )}
            </Grid.Row>
        </Grid>
    );
}



export default Home;