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
