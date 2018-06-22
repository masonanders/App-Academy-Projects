require "byebug"
def range(start, finish)
  return [] if start >= finish
  
  result = [start]
  result += range(start + 1, finish)
  result
end

def range_iter(start, finish)
  i = start
  result = []
  while i < finish
    result << i
    i += 1
  end
  reusult  
end

def exp_1(b, n)
  return 1 if n == 0
  b * exp_1(b, n - 1)
end 

def exp_2(b, n)
  return 1 if n == 0 
  prev_exp = nil 
  if n.even?
    value = exp_2(b, n / 2)
    prev_exp = value * value
  else 
    value = exp_2(b, (n - 1) / 2)
    prev_exp = b * (value * value)
  end
end

def deep_dup(arr)
  return arr if arr.none? { |el| el.is_a? Array }
  result = []
  arr.each do |el|
    if el.is_a? Array
      result << deep_dup(el)
    else
      result << el
    end 
  end
  result
end  

def fibs(num)
  return [] if num == 0 
  case num <=> 2 
  when -1 
    return [0]
  when 0
    return [0, 1]
  when 1
    prev_fibs = fibs(num - 1)
    next_fibs = prev_fibs[-1] + prev_fibs[-2]
    prev_fibs << next_fibs 
  end 
  
end 

def binary_search(arr, target)
  return nil if arr.empty? 
  middle = arr.length / 2
  if arr[middle] == target
    return middle
  elsif arr[middle] > target
    binary_search(arr[0...middle], target)
  else
    something = binary_search(arr[(middle + 1)..-1], target)
    middle + 1 + something unless something == nil
  end
end 

def merge_sort(arr)
  return arr if arr.length <= 1 
  left = arr[0...arr.size / 2]
  right = arr[arr.size / 2.. -1]
  right = merge_sort(right)
  left = merge_sort(left)
  merged = [] 

  until left.empty? && right.empty? 
    case left.first <=> right.first 
    when -1  
      merged << left.shift 
    when 0 
      merged << left.shift 
    when 1 
      merged << right.shift 
    else 
    merged << (left.empty? ? right.shift : left.shift)
    end 
  end 
  merged 

end 

def subsets(arr)
  return [[]] if arr.empty? 
  next_arr = subsets(arr[0...-1]) #[[]]
  new_arr = next_arr.dup
  next_arr.each { |el| new_arr << el + [arr.last] }
  new_arr
end 

def permutate(arr)
  return arr if arr.length == 1
  return [[arr.first, arr.last],[arr.last,arr.first]] if arr.length == 2
  new_arr = []
  arr.each_with_index do |el, idx|
    arr_2 = arr.dup.rotate(idx)
    perms = permutate(arr_2[1..-1])
    perms.each { |el_2| new_arr << [el] + el_2 }
  end 
  new_arr
end 

p permutate([1])


