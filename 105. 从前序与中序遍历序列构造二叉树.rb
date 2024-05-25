# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
    n = preorder.length
    @map = {}
    for i in 0...n
        @map[inorder[i]]=i
    end
    return myBuildTree(preorder,inorder,0,n-1,0,n-1)
end

def myBuildTree(preorder, inorder,pl,pr,il,ir)
    return nil if pl > pr || il > ir

    preorder_root = pl
    inorder_root = @map[preorder[preorder_root]]

    root = TreeNode.new(preorder[preorder_root])

    size_left_subtree = inorder_root - il;
    root.left = myBuildTree(preorder,inorder,pl+1,pl+size_left_subtree,il,inorder_root-1)

    root.right = myBuildTree(preorder,inorder,pl+size_left_subtree+1,pr,inorder_root+1,ir)

    return root

end
