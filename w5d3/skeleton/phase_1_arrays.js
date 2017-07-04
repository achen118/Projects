Array.prototype.uniq = function () {
  const uniqArr = [];
  this.forEach(el => {
    if (!uniqArr.includes(el)) {
      uniqArr.push(el);
    }
  });
  return uniqArr;
};

Array.prototype.twoSum = function () {
  const posArr = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        posArr.push([i, j]);
      }
    }
  }
  return posArr;
};

Array.prototype.transpose = function () {
  const transposeArr = [];
  for (let i = 0; i < this.length; i++) {
    const helperArr = [];
    for (let j = 0; j < this[i].length; j++) {
      helperArr.push(this[j][i]);
    }
    transposeArr.push(helperArr);
  }
  return transposeArr;
};
