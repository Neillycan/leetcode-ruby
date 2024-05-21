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
# @return {Integer}

def diameter_of_binary_tree(root)
    @ans = 1
    depth(root)
    return @ans-1
end

def depth(node)
    return 0 if node.nil?
    l = depth(node.left)
    r = depth(node.right)
    @ans = l+r+1 if l+r+1 >  @ans
    return [l,r].max+1
end
