require "byebug"

class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            ele = self[i]
            prc.call(ele)
            i += 1
        end
        self
    end

    def my_select(&prc)
        # arr = []
        # self.each do |num|
        #     if prc.call(num)
        #         arr << num
        #     end
        # end
        # arr
        arr = self.select { |num| prc.call(num) }
        arr
    end

    def my_reject(&prc)
        arr = self.reject { |num| prc.call(num) }
        arr
    end

    def my_any?(&prc)
        self.any? { |num| prc.call(num) }
    end

    def my_all?(&prc)
        self.all? { |num| prc.call(num) }
    end

    def my_flatten
        self.flatten
    end

    def my_zip(*arrays)
        zipped = []
        self.length.times do |i|
            subzip = [self[i]]
            # subzip << self[i]
            arrays.my_each do |array|
                subzip << array[i]
            end
            zipped << subzip
        end
        zipped
    end

    def my_rotate(n=1)
        if n < 0
            n.abs.times do
                ele = self.pop
                self.unshift(ele)
            end
        else 
            n.times do 
                ele = self.shift
                self.push(ele)
                # debugger
            end
        end
        self
    end


    def my_join(string="")
        new_word = ""
        self.each do |char|
            new_word += char + string
        end
        new_word
    end

end

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
a = [ "a", "b", "c", "d" ]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
a = [ "a", "b", "c", "d" ]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
a = [ "a", "b", "c", "d" ]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]