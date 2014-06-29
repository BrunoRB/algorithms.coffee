### @author Bruno Roberto Búrigo 2014 ###

class BinarySearchTree
    @root = null # Node
    @size = 0

    constructor: (value) ->
        @root = new Node(value)

    insert: (value) ->
        

    delete: (value) ->
        ''

    _find = () ->
        ''

class Node
    @left = null
    @right = null
    @parent = null
    @value = null

    constructor: (value, parent = null) ->
        @value = value
        @parent = parent

try
    module.exports = BinarySearchTree
catch exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
    window.algCoffe.BinarySearchTree = BinarySearchTree
