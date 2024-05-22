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
# @return {TreeNode}
def balance_bst(root)
    @res = []
    travesal(root)
    return bst_helper(@res,0,@res.length-1)
end

def travesal(curr)
    return if curr.nil?
    travesal(curr.left)
    @res<<curr.val
    travesal(curr.right)
end

def bst_helper(nums,left,right)
    return nil if right < left
    mid = (left+right)/2
    node = TreeNode.new(nums[mid])
    node.left = bst_helper(nums,left,mid-1)
    node.right = bst_helper(nums,mid+1,right)
    return node
end
