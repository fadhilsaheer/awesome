import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import firebase from 'firebase';
import "firebase/firestore";
import firebaseconfig from './firebaseConfig'; // create on file named this

firebase.initializeApp(firebaseconfig);

ReactDOM.render(
	<React.StrictMode>
		<App />
	</React.StrictMode>,
	document.getElementById('root')
);