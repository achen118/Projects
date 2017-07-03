function sum() {
  let arr = Array.from(arguments);
  return arr.reduce((total, val) => total + val);
}

function spreadSum(...args) {
  return args.reduce((total, val) => total + val);
}

Function.prototype.myBind = function() {
  let ctx = Array.from(arguments).slice(0, 1)[0];
  let arr = Array.from(arguments).slice(1);
  return () => this.apply(ctx, arr);
};

Function.prototype.myBound = function(context, ...args) {
  return (...callArgs) => this.call(context, ...args, ...callArgs);
};


const curriedSum = function(numArgs) {
  let numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  }
}

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let that = this;
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return that.apply(that, numbers);
    } else {
      return _curriedSum;
    }
  }
}

Function.prototype.spreadCurry = function(numArgs) {
  let numbers = [];
  let that = this;
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return that.call(that, ...numbers);
    } else {
      return _curriedSum;
    }
  }
}

let currSum = sum.spreadCurry(4);
console.log(currSum(5)(30)(20)(1));
