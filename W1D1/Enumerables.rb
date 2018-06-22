require "byebug"

class Array
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |l|
      result << l if prc.call(l)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |l|
      result << l unless prc.call(l)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |l|
      return true if prc.call(l)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |l|
      return false unless prc.call(l)
    end
    true
  end

  def my_flatten
    result = []
    self.my_each do |l|
      if l.class == Array
        arr = l.my_flatten
        arr.my_each {|l| result << l}
      else
        result << l
      end
    end
    result
  end

  def my_zip(*args)
    result = Array.new(self.length) {Array.new()}
    self.each_index do |idx|
      result[idx] << self[idx]
      args.each {|el| result[idx] << el[idx]}
    end
    result
  end

  def my_rotate(shift = 1)
    shift = shift % self.length
    self[shift..-1] + self[0...shift]
  end

  def my_join(joiner = "")
    result = ""
    self.each_with_index do |l, idx|
      result += l
      result += joiner unless idx == self.length - 1
    end
    result
  end

  def my_reverse
    self_2 = self.dup
    result = []
    self.each do |l|
      result << self_2.pop
    end
    result
  end

  def bubble_sort!(&prc)
    sort_again = true

    while sort_again
      sort_again = false
      self.each_index do |idx|
        next if idx == self.length - 1
        sorted = nil
        if block_given?
          sorted = prc.call(self[idx], self[idx + 1])
        else
          sorted = self[idx] <=> self[idx+1]
        end

        if sorted == 1
          self[idx], self[idx+1] = self[idx+1], self[idx]
          sort_again = true
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

def factors(num)
  (1..num).select {|l| num % l == 0}
end

def substrings(string)
  # result = []
  # string.each_with_index do |el, idx|
  #   string[idx + 1, -1]
  #   result << string[idx, ]
  # end
  result = []
  string.chars.each_with_index do |el, idx|
    string.chars.each_index do |idx2|
      next if idx > idx2
      result << string[idx..idx2]
    end
  end
  result
end

def subwords(word, dictionary)
  substrings(word).select {|el| dictionary.include?(el)}.uniq
end
