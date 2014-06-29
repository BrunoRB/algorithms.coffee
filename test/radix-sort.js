(function() {
  var expect, radixSort;

  expect = require('chai').expect;

  radixSort = require('../algorithms').radixSort;

  describe('Radix Sort', function() {
    return describe('Sort an array of integers ', function() {
      return it('should order an array correctly', function() {
        var sortedArray, unsortedArray;
        unsortedArray = [1001, 3, 330, 7, 656, 700, 656, 932, 2];
        sortedArray = [2, 3, 7, 330, 656, 656, 700, 932, 1001];
        return expect(radixSort(unsortedArray)).to.be.deep.equal(sortedArray);
      });
    });
  });

}).call(this);
