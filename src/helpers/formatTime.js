const format2Digit = (value) => {
  if (value.toString().length < 2) {
    return `0${value}`;
  } else {
    return value;
  }
};

module.exports = format2Digit;
