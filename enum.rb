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

def my_all
    if block_given?
        self.my_each do |i|
            return true if yield(i) 
    end
end
    false
end


def my_any
    if block_given?
    self.my_each{|i| return true if yield(i)}
    end
    false
end

def my_none
    if block_given?
        self.my_each {|i| return false if yield(i)}
    end
    true
end

def my_count
    count=0
    self.my_each do |i|
    if block_given? && yield(i)
        count+=1
    else
        count=self.length
 end
end
 count
end

  def my_map(proc = nil)
    result = []
    if proc
      my_each do |p|
        result << proc.call(p)
      end
    else
      my_each do |a|
        result << yield(a)
      end
    end
    result
  end

  def my_inject(init = self[0])
    result = init
    self.my_each do |i|
      next if init == i

      result = yield(result, i)
    end
    result
  end
end

def multiply_els(arg)
  arg.my_inject(1) { |a, b| a * b }
end

#test
[1,2,3,4,5].my_each{|i| puts i}

end






