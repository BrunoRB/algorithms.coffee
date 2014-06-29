var exception;

try {
  module.exports = {
    insertionSort: require('./src/sorting/insertion-sort'),
    radixSort: require('./src/sorting/radix-sort'),
    mergeSort: require('./src/sorting/merge-sort'),
    BinarySearchTree: require('./src/data-structures/binary-search-tree')
  };
} catch (_error) {
  exception = _error;
  console.log(exception);
  window.algCoffe = window.algCoffe ? window.algCoffe : {};
}
