class Array
  def my_quicksort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return self if size < 2
    #Optimization of comparisons by shuffling array
    self.shuffle!

    pivot = first
    left = self[1..-1].select { |el| prc.call(el, pivot) == -1 }
    right = self[1..-1].select { |el| prc.call(el, pivot) != -1 }

    left.my_quicksort(&prc) + [pivot] + right.my_quicksort(&prc)
  end
end

arr1 = [3, 5, 2, 8, 9, 1 , 0, 10]
arr2 = [1, 9, 3, 4, 3, 8, 4, 5]
arr3 = [-3, 5, 2, 100, 1, 42, 1]
# print arr1.my_quicksort
# print arr2.my_quicksort
# print arr3.my_quicksort