import axios from 'axios';

const url = 'http://localhost:5000/'; // feel free to change it

export const fetchPosts = () => axios.get(url);