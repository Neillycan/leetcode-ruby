class LRUCache

    class Node
        attr_accessor :key, :value, :prev, :next
        def initialize(key,value)
            @key = key
            @value = value
            @prev = nil
            @next = nil
        end   
    end


    class DDL

        def initialize
            @head = Node.new(nil,nil)
            @last = Node.new(nil,nil)
            @head.next = @last
            @last.prev = @head
        end



        def unshift(node)
            tmp = @head.next
            @head.next = node
            node.prev = @head
            node.next = tmp
            tmp.prev = node
        end


        def delete(node)
            node.prev.next = node.next
            node.next.prev = node.prev
        end

        def pop
            tmp = last
            delete(last)
            tmp
        end

        def head
            @head.next
        end

        def last
            @last.prev
        end

    end


=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @cache = {}
        @capacity = capacity
        @ddl = DDL.new
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        return -1 if @cache[key].nil?
        node = @cache[key]
        @ddl.delete(node)
        @ddl.unshift(node)
        return node.value
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if !@cache[key].nil?
            node = @cache[key]
            node.value = value
            if @ddl.head != node
                @ddl.delete(node)
                @ddl.unshift(node)
            end
        else
            if @cache.size == @capacity
                @cache.delete(@ddl.last.key)
                @ddl.pop
                
            end
            node = Node.new(key, value)
            @cache[key] = node
            @ddl.unshift(node)
        end
    end


end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
