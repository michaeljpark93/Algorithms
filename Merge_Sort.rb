class Array
  def merge_sort(&prc)
    # if no proc is passed in declares comparator proc
    prc ||= Proc.new { |x, y| x <=> y }

    # returns the array if length if 1 or less
    return self if self.length <= 1
    
    # recursive call back to function to continue to split each into portion into individual elements
    midpoint = self.length / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    # compares first element of left and right arrays and pushes to merged array
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged.push(left.shift)
      when 0
        merged.push(left.shift)
      when 1
        merged.push(right.shift)
      end
    end

    # adds any leftover items at the end of the array once left or right are empty
    merged.concat(left)
    merged.concat(right)

    merged
  end
end

arr1 = [3, 5, 2, 8, 9, 1 , 0, 10]
arr2 = []
arr3 = [-3, 5, 2, 100, 1, 42, 1]
# print arr1.merge_sort
# print arr2.merge_sort
# print arr3.merge_sort
