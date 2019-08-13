# frozen_string_literal: true

module Enumerable
  def my_each
    if block_given?
      i = 0
      while i < length
        yield(self[i])
        i += 1

      end
      self
    else
      to_enum
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < length
        yield(self[i], i)
        i += 1
      end
      self
    else
      to_enum
    end
  end

  def my_select
    selected = []
    my_each do |x|
      selected.push(x) if yield(x)
    end
    selected
  end

  def my_all?
    if block_given?
      my_each do |i|
        return true if yield(i)
      end
    end
    false
  end

  def my_any?
    if block_given?
      my_each { |i| return true if yield(i) }
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |i| return false if yield(i) }
    end
    true
  end

  def my_count(arg = nil)
    if !arg.nil?
      i = 0
      my_each do |item|
        i += 1 if item == arg
      end
      i
    elsif block_given?
      my_select { |item| yield(item) }.length
    else
      i = 0
      my_each { |_item| i += 1 }
      i
    end
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
    my_each do |i|
      next if init == i

      result = yield(result, i)
    end
    result
  end
end

def multiply_els(arg)
  arg.my_inject(1) { |a, b| a * b }
end

# test
puts multiply_els([1, 2, 3, 4, 5])
puts [1, 1, 1, 2, 3, 4, 5].my_count(1)
