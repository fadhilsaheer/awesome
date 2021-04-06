import { useContext } from 'react';
import { SocketContext } from '../SocketContext';

import { Grid, Paper, Typography } from '@material-ui/core';
import { makeStyles } from '@material-ui/core/styles';


const useStyles = makeStyles((theme) => ({
    video: {
        width: '550px',
        [theme.breakpoints.down('xs')]: {
            width: '300px',
        },
    },
    gridContainer: {
        justifyContent: 'center',
        [theme.breakpoints.down('xs')]: {
            flexDirection: 'column',
        },
    },
    paper: {
        padding: '10px',
        border: '2px solid black',
        margin: '10px',
    },
}));

const VideoPlayer = () => {
    const classes = useStyles();


    return (
        <Grid container className={classes.gridContainer}>
            <Paper className={classes.paper}>
                <Grid item xs={12} md={6}>
                    <Typography variant="h5" gutterBottom>Name</Typography>
                    <video autoPlay playsInline muted ref={'myVideo'} className={classes.video} />
                </Grid>
            </Paper>
        </Grid>
    );
}

export default VideoPlayer;