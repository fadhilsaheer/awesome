// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

	console.log('Congratulations, your extension "VsTodo" is now active!');

	context.subscriptions.push(vscode.commands.registerCommand('VsTodo.helloWorld', () => {
		vscode.window.showInformationMessage('Hello World from vsTodo because it is awesome');
	}));


	context.subscriptions.push(vscode.commands.registerCommand("VsTodo.askQuestion", async ()=>{
		const answer = await vscode.window.showInformationMessage("How was your day ??", "good", "bad");

		if(answer === "bad"){
			vscode.window.showInformationMessage("Hope the rest of your day is good");
			return;
		}
		if(answer === "good"){
			vscode.window.showInformationMessage("Well be happy");
			return;
		}else{
			vscode.window.showInformationMessage("Why ??");
			return;
		}
	}));
}

export function deactivate() {}
