var exception;

try {
  module.exports = {
    insertionSort: require('./src/sorting/insertion-sort'),
    radixSort: require('./src/sorting/radix-sort'),
    mergeSort: require('./src/sorting/merge-sort'),
    karatsubaMultiplication: require('./src/math/karatsuba-multiplication'),
    bellmanFord: require('./src/graph/bellman-ford'),
    BinarySearchTree: require('./src/data-structures/binary-search-tree'),
    AdjacencyList: require('./src/data-structures/adjacency-list')
  };
} catch (_error) {
  exception = _error;
  console.log(exception);
  window.algCoffe = window.algCoffe ? window.algCoffe : {};
}
