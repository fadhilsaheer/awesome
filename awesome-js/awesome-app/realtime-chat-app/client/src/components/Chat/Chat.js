import { useState, useEffect } from 'react';
import queryString from 'query-string';
import io from 'socket.io-client';

import './chat.css';

import InfoBar from '../InfoBar/InfoBar';
import Input from '../Input/Input';
import Messages from '../Messages/Messages';
import TextContainer from '../TextContainer/TextContainer';

let socket;

const Chat = ({ location }) => {
    const [name, setName] = useState('');
    const [room, setRoom] = useState('');
    const [users, setUsers] = useState([]);
    const [messages, setMessages] = useState([]);
    const [message, setMessage] = useState('');

    const ENDPOINT = 'localhost:5000';

    useEffect(() => {
        const { name, room } = queryString.parse(location.search);

        let connectionOptions =  {
            "force new connection" : true,
            "reconnectionAttempts": "Infinity", 
            "timeout" : 10000,                  
            "transports" : ["websocket"]
        };

        socket = io(ENDPOINT ,connectionOptions);

        setName(name);
        setRoom(room);

        socket.emit("join", { name, room }, () => {

        });

        return () => {
            socket.emit("disconnect");

            socket.off();
        }

    }, [ENDPOINT, location.search]);

    useEffect(() => {
        socket.on("message", message => {
            setMessages([...messages, message]);
        })

        socket.on("roomData", ({ users }) => {
            setUsers(users);
        });

    }, [])


    // function for sending message

    const sendMessage = (event) => {
        event.preventDefault();

        if(message){
            socket.emit('sendMessage', message, () => setMessage(''));

        }
    }

    return(
        <div className="outerContainer">
            <div className="container">
                <InfoBar room={room} />
                <Messages messages={messages} name={name} />
                <Input message={message} setMessage={setMessage} sendMessage={sendMessage} />
            </div>
            <TextContainer users={users}/>
        </div>
    );
}
 
export default Chat;