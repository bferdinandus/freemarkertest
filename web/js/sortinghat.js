var sortingHat = sortingHat || {};

sortingHat.test = (function() {
	var internalState = "Message";

	var privateMethod = function() {
		// Do private stuff, or build internal.
		return internalState;
	};
	var publicMethod = function() {
		return privateMethod() + " stuff";
	};

	return {
		someProperty: 'prop value',
		publicMethod: publicMethod
	};
})();