### @author Bruno Roberto Búrigo 2014 ###

class BinarySearchTree
    @root = null
    @size = 0

    constructor: (root) ->
        @root = root

class Node
    @left = null
    @right = null
    @parent = null
    @value = null

    insert: (value) ->
        if value >= @value

        else !=


    delete: (value) ->
        ''

    _find = () ->
        ''

try
    module.exports = BinarySearchTree
catch exception
    window.algCoffe =  if window.algCoffe then window.algCoffe else {}
    window.algCoffe.BinarySearchTree = BinarySearchTree
