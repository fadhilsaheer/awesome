import { ChatEngine } from "react-chat-engine"; // react chat engine
import "./Main.css";

import ChatFeed from "./components/ChatFeed";

const App = () => {
  return (
    <ChatEngine
      height="100vh"
      projectID="859923c6-722b-4e31-b0e9-c5fdd5a1612b"
      userName="ubot"
      userSecret="123"
      renderChatFeed={(chat) => <ChatFeed {...chat} />}
    />
  );
};

export default App;
