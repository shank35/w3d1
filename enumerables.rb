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

end

