class Timout
end
class Clock {
  constructor() {
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    setInterval(this._tick, 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    console.log(this);
    this.seconds++;
    if (this.seconds === 60) {
      this.minutes++;
      if (this.minutes === 60) {
        this.hours++;
        if (this.hours === 24) {
          this.hours = 0;
        }
        this.minutes = 0;
      }
      this.seconds = 0;
    }
    this.printTime();
  }
}

const clock = new Clock();
// clock._tick();
