import "./input.css";

const Input = ({ setMessage, sendMessage, message }) => {
  return (
    <form className="form">
      <input 
        className="input" 
        type="text" 
        placeholder="Type Message"
        value={message}
        onChange={(event) => setMessage(event.target.value)}
        onKeyPress={event => event.key === 'Enter' ? sendMessage(event) : null}
      />
      <button className="sendButton" onClick={(event)=> sendMessage(event)}>Send</button>
    </form>
  );
};

export default Input;
