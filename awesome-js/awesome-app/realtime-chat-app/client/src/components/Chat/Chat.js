import { useState, useEffect } from 'react';
import queryString from 'query-string';
import io from 'socket.io-client';

import './chat.css';

let socket;

const Chat = ({ location }) => {
    const [name, setName] = useState('');
    const [room, setRoom] = useState('');
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

        socket.emit("join", { name, room });
        
    }, [ENDPOINT, location.search]);

    return(
        <div>
            <h1>Chat</h1>
        </div>
    );
}
 
export default Chat;