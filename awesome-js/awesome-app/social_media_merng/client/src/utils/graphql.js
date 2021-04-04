import gql from 'graphql-tag';

export const FETCH_QUERY_POST = gql`
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