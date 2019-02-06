list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def p1_min?(arr)
  arr.each do |ele|
    return ele unless arr.any? { |other_ele| other_ele < ele }
  end
end

def p2_min?(arr)
  min = 0
  arr.each do |ele|
    min = ele if ele < min
  end
  min
end

list = [2, 3, -6, 7, -6, 7]

# sub_arrays/lcss has a O(n^2) time complexity since we have to loop over the array n number of times (depending on length of n) then
# have to reloop thru each element and gather all sums before it compares it
# as far as space complexity it is O(n^2/2) because we end up with roughly half the square of n length
def sub_arrays(arr)
  sub_arr = []
  i_arr = []
  arr.length.times do |x|
    arr.map do |ele1|
      i_arr += [ele1]
      sub_arr << i_arr
    end
    i_arr = []
    arr.shift
  end
  sub_arr
end

def lcss(arr)
  sub_arr = sub_arrays(arr)
  total_arr = []
  sub_arr.each do |sub|
    total = sub.inject(0) do |a, b|
      a+b
    end
    total_arr << total
  end
  biggest_sum = total_arr.max
  biggest_ind = total_arr.index(biggest_sum)
  sub_arr[biggest_ind]
end

# O(n) time / O(1) space method
# space complexity is constant since it doesnt store any other values other than the max
# time complexity is O(n) since it adds the array and compares it to the current largest sum in the same loop
def fast_lcss(arr)
  i_arr = []
  biggest = 0
  max_sub_arr = []
  arr.length.times do |x|
    arr.map do |ele1|
      i_arr += [ele1]
      sum = i_arr.inject(0) do |a, b|
        a + b
      end
      max_sub_arr = i_arr if sum > biggest
      biggest = sum if sum > biggest 
    end
    i_arr = []
    arr.shift
  end
  max_sub_arr
end
# p p2_min?(list)
# p sub_arrays(list)
# p fast_lcss(list)