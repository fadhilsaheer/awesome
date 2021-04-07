import React from "react";
import { useSelector } from 'react-redux';

import Post from "./post/Post";
import useStyles from "./style";


function Posts() {
  const posts = useSelector((state)=> state.posts);
  const classes = useStyles();
  
  console.log(posts)
  return (
    <>
      <h1>POSTS</h1>
      <Post />
      <Post />
    </>
  );
}

export default Posts;
