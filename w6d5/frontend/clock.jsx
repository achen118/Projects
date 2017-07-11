import React from 'react';

class Clock extends React.Component {
  componentDidMount() { this.interval = setInterval(this.tick, 1000); }
  componentWillUnmount() { clearInterval(this.interval); }

  constructor(props) {
    super(props);
    let date = new Date().toString();
    const time = date.split("").slice(15).join("");
    date = date.split("").slice(0,15).join("");
    this.state = { time: time, date: date };
    this.tick = this.tick.bind(this);
  }

  render() {
    return (
      <div className="outside-div">
        <h1>Clock</h1>
        <div className="clock">
          <ul><li>TIME:</li><li>{this.state.time}</li></ul>
          <ul><li>DATE:</li><li>{this.state.date}</li></ul>
        </div>
      </div>
    );
  }

  tick() {
    let date = new Date().toString();
    const time = date.split("").slice(15).join("");
    date = date.split("").slice(0,15).join("");
    this.setState({ time: time, date: date });
  }
}

export default Clock;
