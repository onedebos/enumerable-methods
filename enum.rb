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

=begin
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


def my_select
    if block_given?
        selected=[]
        self.my_each do |x|
            if yield(x)
                selected.push(x)
        end
    end
        selected
    else
        self.to_enum
    end
end
=end
def my_all
    if block_given?

        self.my_each{ |i| return false if yield(i)==false}
                return true
            else
                self.my_each {|i| return false unless i==true}
                return true
        end
    end




puts [1,2,3,4,5].my_all{|n| n%2==0 }

end






