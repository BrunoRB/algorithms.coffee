### @author Bruno Roberto Búrigo 2014 ###

class BinarySearchTree

    constructor: (value, parent = null) ->
        @root = new BSTNode(value, parent) # BSTNode

    insert: (value) ->
        if value < @root.value
            if @root.left is null
                @root.left = new BinarySearchTree(value, @root)
                return @root.left
            else
                @root.left.insert(value)
        else
            if @root.right is null
                @root.right = new BinarySearchTree(value, @root)
                return @root.right
            else
                @root.right.insert(value)

    delete: (value) ->
        ''

    _find = () ->
        ''

    class BSTNode

        constructor: (value, parent = null) ->
            @value = value # anything
            @parent = parent # BinarySearchTree
            @left = null # BinarySearchTree
            @right = null # BinarySearchTree

try
    module.exports = BinarySearchTree
catch exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
    window.algCoffe.BinarySearchTree = BinarySearchTree
