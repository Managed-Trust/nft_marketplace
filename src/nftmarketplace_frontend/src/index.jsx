import React from 'react';
import ReactDOM from 'react-dom';
import "./assets/animated.css";
import '../../../node_modules/font-awesome/css/font-awesome.min.css'; 
import '../../../node_modules/elegant-icons/style.css';
import '../../../node_modules/et-line/style.css';
import '../../../node_modules/bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap';
import './assets/style.scss';
import './assets/style_grey.scss';
import App from './components/App';
import * as serviceWorker from './serviceWorker';
import { BrowserRouter } from "react-router-dom";

//redux store
import { Provider } from 'react-redux'
import store from './store';
// import App from './App';
ReactDOM.render(
	<Provider store={store} >
		<BrowserRouter>
			<App />
		</BrowserRouter>
	</Provider>, 
	document.getElementById('root'));
// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();