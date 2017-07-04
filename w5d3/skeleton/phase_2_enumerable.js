Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const mapArr = [];
  this.myEach( el => mapArr.push(callback(el)));
  return mapArr;
};

Array.prototype.myReduce = function (callback, initialValue) {
  let arr = this;
  if (!initialValue) {
    initialValue = this[0];
    arr = this.slice(1);
  }
  let result = initialValue;
  arr.myEach(el => result = callback(result, el));
  return result;
};
