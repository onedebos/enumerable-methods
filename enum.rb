module Enumerable
    def my_each
        if block_given?
            i=0
            while (i<self.length)
                yield(self[i])
                i+=1
                
            end
            self
        else
            self.to_enum
        end
        
    end
    
end

puts [1,2,3,4,5].my_each{|i| puts i}