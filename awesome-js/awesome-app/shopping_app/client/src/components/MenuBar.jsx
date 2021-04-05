import { useState, useContext } from 'react';
import { AuthContext } from '../context/auth';
import { AppBar, Typography, Toolbar, MenuItem, IconButton, Menu } from '@material-ui/core';
import { AccountCircle } from '@material-ui/icons';
import { Link } from 'react-router-dom';

function MenuBar() {

    const { user } = useContext(AuthContext)

    const [anchorEl, setAnchorEl] = useState(null);
    const open = Boolean(anchorEl);

    const handleMenu = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const handleClose = () => {
        setAnchorEl(null);
    };




    return (
        <AppBar position="static">
            <Toolbar>
                <Typography variant="h6">Shopping App</Typography>
                <div className="navbar-top-icon">
                    <IconButton
                        aria-label="account of current user"
                        aria-controls="menu-appbar"
                        aria-haspopup="true"
                        onClick={handleMenu}
                        color="inherit"
                    >
                        <AccountCircle />
                    </IconButton>
                    <Menu
                        id="menu-appbar"
                        anchorEl={anchorEl}
                        anchorOrigin={{
                            vertical: 'top',
                            horizontal: 'right',
                        }}
                        keepMounted
                        transformOrigin={{
                            vertical: 'top',
                            horizontal: 'right',
                        }}
                        open={open}
                        onClose={handleClose}
                    >
                        {user ? (
                            <>
                                <MenuItem>{user.name}</MenuItem>
                                <MenuItem>{user.email}</MenuItem>
                                <MenuItem component={Link} to="/logout">Logout</MenuItem>
                            </>
                        ) : (
                            <>
                                <MenuItem component={Link} to="/">Home</MenuItem>
                                <MenuItem component={Link} to="/login">Login</MenuItem>
                                <MenuItem component={Link} to="/register">Register</MenuItem>
                            </>
                        )}

                    </Menu>
                </div>
            </Toolbar>
        </AppBar>
    )
}

export default MenuBar
