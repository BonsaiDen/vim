var _ = true;
_ = false;
_ = undefined;
_ = setTimeout(function() {
    arguments = _;
}, 10);
_ = setInterval(function() {
}, 10);
clearTimeout(_);
clearInterval(_);
_.prototype = {};
_.constructor = {};
_.hasOwnProperty(_);
Error.prototype = {};
Object.prototype = {};
Function.prototype = {};

delete _;
typeof _;
instanceof _;
_.toString();

