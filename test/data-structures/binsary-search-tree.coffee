
expect = require('chai').expect
BinarySearchTree = require('../../algorithms').BinarySearchTree

describe 'Binary Search Tree', ->

    describe 'Create a new BST', ->
        it 'should create a BST with the root Node having a value 10', ->
            bst = new BinarySearchTree 10

            expect(bst.root).to.be.a 'object'
            expect(bst.root.value).to.be.equal 10
            expect(bst.root.left).to.be.equal null
            expect(bst.root.right).to.be.equal null

        it 'should create a new BST with the root Node having a object has value', ->
            someData =
                height: 200
                distance: 13.3

            bst = new BinarySearchTree someData

            expect(bst.root).to.be.a 'object'
            expect(bst.root.left).to.be.equal null
            expect(bst.root.right).to.be.equal null
            expect(bst.root.value).to.be.a 'object'
            expect(bst.root.value).to.have.property('height').equal 200
            expect(bst.root.value).to.have.property('distance').equal 13.3

    describe 'Insert values into a BST', ->

        it 'should retrieve the newly created subtree object', ->
            bst = new BinarySearchTree 10

            bstTwo = bst.insert(20)
            bstThree = bst.insert(5)
            bstFour = bst.insert(30)

            for subTree in [bstTwo, bstThree, bstFour]
                expect(subTree).to.be.a 'object'
                expect(subTree.root).to.be.a 'object'
                expect(subTree.root.value).to.be.a 'number'

        it 'should place new subtrees at the correct branch of the BST', ->
            bst = new BinarySearchTree 10

            bst.insert(20)
            bst.insert(5)
            bst.insert(30)
            expect(bst.root.right).to.be.a 'object'
            expect(bst.root.right.root).to.be.a 'object'
            expect(bst.root.right.root.value).to.be.equal 20

            expect(bst.root.left).to.be.a 'object'
            expect(bst.root.left.root).to.be.a 'object'
            expect(bst.root.left.root.value).to.be.equal 5

            expect(bst.root.right.root.right).to.be.a 'object'
            expect(bst.root.right.root.right.root).to.be.a 'object'
            expect(bst.root.right.root.right.root.value).to.be.equal 30

    describe 'Delete nodes off a BST', ->
        it 'should properly remove nodes of the bst', ->
            bst = new BinarySearchTree 10
            bstTwo = bst.insert(20)
            bstThree = bst.insert(5)
            bstFour = bst.insert(30)
