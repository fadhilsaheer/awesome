import socket
import threading

HOST = '127.0.0.1'
PORT = 8080

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))

server.listen()

clients = []
nicknames = []

def broadcast(message):
    for client in clients:
        client.send(message)


def recieve():
    while True:
        client, address = server.accept()
        print(f"connected with {str(address)}")

        client.send("NICK".encode('utf-8'))
        nickname = client.recv(1024)

        nicknames.append(nickname)
        clients.append(client)

        print(f"Nickname of client is {nickname}")

        broadcast(f"{nickname} connected to the server!\n".encode("utf-8"))
        client.send("Connected to the server".encode('utf-8'))





