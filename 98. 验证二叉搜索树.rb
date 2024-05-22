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
# @return {Boolean}

# 方法一：前序遍历
def is_valid_bst(root)
    return valid_bst(root,-Float::INFINITY,Float::INFINITY)
end

def valid_bst(node,left,right)
    return true if node.nil?
    x = node.val
    return left < x && x < right && 
        valid_bst(node.left,left,x) && 
        valid_bst(node.right,x,right)
end


# 方法二：中序遍历
def is_valid_bst(root)
    @pre = -Float::INFINITY
    return valid_bst(root)
end

def valid_bst(root)  
    return true if root.nil?

    if !valid_bst(root.left)
        return false
    end

    if root.val <= @pre
        return false
    end

    @pre = root.val

    return valid_bst(root.right)

end


