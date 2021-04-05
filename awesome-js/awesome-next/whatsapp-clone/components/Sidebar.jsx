import { Avatar, IconButton, Button } from "@material-ui/core";
import styled from 'styled-components'
import ChatIcon from "@material-ui/icons/Chat";
import MoreVertIcon from "@material-ui/icons/MoreVert";
import SearchIcon from '@material-ui/icons/Search';
import * as EmailValidator from "email-validator";

function Sidebar() {

    const createChat = () => {
        const input = prompt('Who do you wanna chat with ?? [ email ]');

        if (!input) return null;

        if (!EmailValidator.validate(input)) {
            alert(`${input} is not a valid email`);
            return null;
        }

    }

    return (
        <Container>

            <Header>
                <UserAvatar />

                <IconsContainer>
                    <IconButton>
                        <ChatIcon />
                    </IconButton>
                    <IconButton>
                        <MoreVertIcon />
                    </IconButton>
                </IconsContainer>
            </Header>

            <Search>
                <SearchIcon />
                <SearchInput placeholder="Search in chats" />
            </Search>

            <SideBarButton onClick={createChat}>Start A New Chat</SideBarButton>

        </Container>
    )
}

export default Sidebar;

const Container = styled.div``;

const Header = styled.div`
    display: flex;
    position: sticky;
    top: 0;
    background-color: white;
    z-index: 1;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    height: 80px;
    border-bottom: 1px solid whitesmoke;
`;


const UserAvatar = styled(Avatar)`
    cursor: pointer;
    transition: 0.5s;
    :hover {
        opacity: 0.8;
    }
`;

const IconsContainer = styled.div``;

const Search = styled.div`
    display: flex;
    align-items: center;
    padding: 20px;
    border-radius: 2px; 
`;

const SearchInput = styled.input`
    outline-width: 0;
    border: none;
    flex: 1;
`;

const SideBarButton = styled(Button)`
    &&& {
        width: 100%;
        border-top: 1px solid whitesmoke;
        border-bottom: 1px solid whitesmoke;
    }
`;
