# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
    res = []
    stack = []
    while stack.size>0 || !root.nil?
        if !root.nil?
            stack << root
            root = root.left
        else
            tmp = stack.pop
            res << tmp.val
            root = tmp.right
        end
    end
    return res
end
