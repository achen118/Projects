const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Enter a number ', function(res) {
      const thisNumber = parseInt(res);
      sum += thisNumber;
      console.log(sum);
      addNumbers(sum, numsLeft-1, completionCallback);
    });
  }
  else {
    completionCallback(sum);
    reader.close();
  }
}
addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});
