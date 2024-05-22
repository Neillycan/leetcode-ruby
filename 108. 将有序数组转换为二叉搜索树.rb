# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
    return bst_helper(nums,0,nums.length-1)
end

def bst_helper(nums,left,right)
    return nil if left > right

    mid = (left + right)/2

    root = TreeNode.new(nums[mid])
    root.left = bst_helper(nums,left,mid-1)
    root.right = bst_helper(nums,mid+1,right)

    return root
end
