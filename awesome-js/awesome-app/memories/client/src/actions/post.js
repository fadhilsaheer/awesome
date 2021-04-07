import * as api from '../api';

// action creator
export const getPosts = () => async (dispatch) => {
    try {
        const { data } = await api.fetchPosts();
        dispatch({ type: 'FETCH ALL', payload: data });
    } catch (error) {
        console.log(error.message)
    }
}

