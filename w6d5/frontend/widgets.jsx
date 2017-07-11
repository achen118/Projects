import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Weather from './weather';

document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("clock");
	ReactDOM.render(<Clock />, root);
});

document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("weather");
	ReactDOM.render(<Weather />, root);
});
