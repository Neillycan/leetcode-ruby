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
#*****************************递归***********************************
def is_symmetric(root)
    return true if root.nil? || (root.left.nil? && root.right.nil?)
    return check(root.left,root.right)
end

def check(p,q)
    if p.nil? && q.nil?
        return true
    end

    if p.nil? || q.nil?
        return false
    end

    return p.val == q.val && check(p.left,q.right) && check(q.left,p.right)
end


#*****************************迭代***********************************
def is_symmetric(root)
    return true if root.nil? || (root.left.nil? && root.right.nil?)

    return check(root.left,root.right)
end

def check(u,v)

    q = []
    q << u
    q << v
    while q.length > 0
        u = q.shift
        v = q.shift

        if u.nil? && v.nil?
            next
        end

        if (u.nil? || v.nil?) || (u.val != v.val)
            return false
        end

        q << u.left
        q << v.right

        q << u.right
        q << v.left
    end

    return true

end
