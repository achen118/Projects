import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      weather: null
    };
    this.pollWeather = this.pollWeather.bind(this);
  }

  toQueryString(obj){
  let parts = [];
  for (let i in obj) {
      if (obj.hasOwnProperty(i)) {
          parts.push(`${encodeURIComponent(i)}=${encodeURIComponent(obj[i])}`);
      }
  }
  return parts.join('&');
}

componentDidMount() {
  navigator.geolocation.getCurrentPosition(this.pollWeather);
}

  pollWeather(location){
    let lat = location.coords.latitude;
    let long = location.coords.longitude;
    let url = 'http://api.openweathermap.org/data/2.5/weather?';
    const xhr = new XMLHttpRequest();
    let params = {
      lat: location.coords.latitude,
      lon: location.coords.longitude
    };
    url += this.toQueryString(params);
    const apiKey = "7bf15bd7b71c42f55b57997c02506536";
    url += `&APPID=${apiKey}`;
    xhr.onreadystatechange = () => {
      if (xhr.status === 200 && xhr.readyState === XMLHttpRequest.DONE ){
        const data = JSON.parse(xhr.responseText);
        this.setState({weather: data});
      }
    };
    xhr.open("GET", url, true);
    xhr.send();
  }

  render() {
    let content = (<div></div>);
    if (this.state.weather){
      let weather = this.state.weather;
      let temp = (weather.main.temp - 273.15) * 1.8;
      content = <div>
                  <p>{weather.name}</p>
                  <p>{temp.toFixed(1)} degrees</p>
                </div>;
    }else{
      content = <div className='loading'>loading weather...</div>;
    }
    return (
      <div>
        <h1 className="weathertitle">Weather</h1>
        <div className='weather'>
          {content}
        </div>
      </div>
    );
    }
  }

export default Weather;
