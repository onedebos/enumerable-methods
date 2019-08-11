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


def my_each_with_index
    if block_given?
        i=0
        while(i<self.length)
           yield(self[i],i) 
           i+=1
        end
        self
    else
        self.to_enum
    end
end

end


[1,2,3,4,5].my_each_with_index{|e,index| puts e,index}