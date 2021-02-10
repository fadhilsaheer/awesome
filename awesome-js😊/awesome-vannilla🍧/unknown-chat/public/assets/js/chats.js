const socket = io();

const user = JSON.parse(sessionStorage.getItem("user"));
let ifUser = user
  ? socket.emit("user-join", user)
  : (window.location.href = "/index.html");

// adding to dom

let chatbox = document.querySelector(".chatbox"); // chatbox
let clientsDataDiv = document.querySelector(".clients"); // chatbox
// chatbox.style.display = "none"

let userInfo = document.querySelector(".user");

userInfo.innerHTML = `

<div class="user-info">
    <img src="${user.profile}">
    <div class="user-info-profile-text">
        <span>${user.name}</span>
        <p>${user.email}</p>
    </div>
</div>

<button class="btn" id="logout-btn">Logout</button>

`;

// logout

let logoutBtn = document.getElementById("logout-btn");
logoutBtn.addEventListener("click", () => {
  sessionStorage.removeItem("user");
  window.location.href = "/index.html";
});

// socket connection

socket.on("clients", (data) => {
  let parent = document.querySelector("#contacts");
  let tracker = [];
  parent.innerHTML = "";

  socket.emit("get-id");
  socket.on("id", (id) => {
    data.map((client) => {
      if (client.id != id) {
        if (tracker.includes(client) == false) {
          let userDiv = `
                    <li class="pointer" onclick="joinRoom('${client.id}')">
                      <div class="d-flex bd-highlight">
                        <div class="img_cont">
                          <img
                            src="${client.profile}"
                            class="user_img"
                          />
                          <!--<span class="online_icon offline"></span>-->
                        </div>
                        <div class="user_info">
                          <span>${client.name}</span>
                          <p>${client.email}</p>
                        </div>
                      </div>
                    </li>
            `;

          parent.innerHTML += userDiv;
          tracker.push(client);
        }
      }
    });
  });
});

// ! chat mesaages

let message = document.querySelector(".messages"); // message div

function createChatRoom(id, name, email) {
  let client = { id, name, email };
  clientsDataDiv.style.display = "none";
  chatbox.style.display = "block";
}

function clearChat(div) {
  div = document.querySelector(div);
  div.innerHTML = "";
}

function outputMessage(client, msg) {
  let msgDiv = document.querySelector(".messages-div");
  clearChat(".feedback-div");
  let chatDiv;
  if (client.email == user.email) {
    chatDiv = `
      <div class="d-flex justify-content-end mb-4">
        <div class="msg_cotainer_send">
          ${msg}
          <span class="msg_time_send">${client.name}</span>
        </div>
        <div class="img_cont_msg">
          <img
            src="${client.profile}"
            class="rounded-circle user_img_msg"
          />
        </div>
      </div>
    `;
  } else {
    chatDiv = `
    <div class="d-flex justify-content-start mb-4">
      <div class="img_cont_msg">
        <img
          src="${client.profile}"
          class="rounded-circle user_img_msg"
        />
      </div>
      <div class="msg_cotainer">
        ${msg}
        <span class="msg_time_send">${client.name}</span>
      </div>
    </div>
    `;
  }

  msgDiv.innerHTML += chatDiv;
}

let clientId;

function joinRoom(id) {
  let chatDetails = document.querySelector(".chat-details");
  socket.emit("get-room", id);
  socket.on("send-user", (client) => {
    if (id == "public") {
      client = {
        name: "Public",
        profile: "https://img.icons8.com/nolan/64/ioxhost.png",
        email: "public@public.com",
      };
    }

    chatDetails.innerHTML = `
    <div class="img_cont">
      <img
        id = "chat-img"
        src="${client.profile}"
        class="rounded-circle user_img"
      />
    </div>
    <div class="user_info">
      <span id="chat-user">${client.name}</span>
    </div>
    `;
  });

  socket.emit("joinRoom", id);
  clientId = id;

  clearChat(".messages-div");
}

socket.on("message", (data) => {
  client = data.currentUser[0];
  target = data.targetUser;

  if (target.id != "public") {
    if (target.email == user.email || client.email == user.email) {
      if (clientId != "public") {
        outputMessage(client, data.msg);
      }
    }
  } else {
    if(clientId == "public"){
      outputMessage(client, data.msg);
    }
  }
});

socket.on("typing", (data) => {
  client = data.currentUser[0];
  target = data.targetUser;
  let feedback = document.querySelector(".feedback-div");
  clearChat(".feedback-div");

  if (client.email != user.email) {
    if (target.id != "public") {
      if (clientId != "public") {
        feedback.innerHTML = `
          <div class="d-flex justify-content-start mb-4">
              <div class="img_cont_msg">
                <img
                  src="${client.profile}"
                  class="rounded-circle user_img_msg"
                />
              </div>
              <div class="msg_cotainer">
                typing ...
                <span class="msg_time_send">${client.name}</span>
              </div>
            </div>
        `;
      }
    } else {
      if(clientId == "public"){
        feedback.innerHTML = `
        <div class="d-flex justify-content-start mb-4">
            <div class="img_cont_msg">
              <img
                src="${client.profile}"
                class="rounded-circle user_img_msg"
              />
            </div>
            <div class="msg_cotainer">
              typing ...
              <span class="msg_time_send">${client.name}</span>
            </div>
          </div>
      `;
      }
    }
  }
});

// getting chat

let sendBtn = document.querySelector(".send-btn");
let textField = document.querySelector(".type_msg");

sendBtn.addEventListener("click", () => {
  if (textField.value.length != 0) {
    socket.emit("chatMessage", textField.value, clientId);

    textField.value = "";
  }
});

textField.addEventListener("keypress", () => {
  if (textField.value.length != 0) {
    socket.emit("typing", clientId);
  }
});

setInterval(() => {
  if (textField.value.length == 0) {
    clearChat(".feedback-div");
  }
}, 3000);

joinRoom("public"); // get default public
