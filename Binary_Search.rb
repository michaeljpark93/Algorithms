# Recursive solution O(log N)
def binary_search(arr, target, min = 0, max = arr.length - 1)
  return -1 if max < min
  
  mid = (min + max) / 2
  if arr[mid] == target
    return mid
  elsif arr[mid] > target
    binary_search(arr, target, low, mid - 1)
  else
    binary_search(arr, target, mid + 1, max)
  end
end

#Iterative solution: O(log N)
def binary_search(arr, target)
  min = 0
  max = arr.length - 1

  while min <= max
    mid = min + ((max - min) / 2)

    if arr[mid] == target
      return mid
    elsif arr[mid] > target
      max = mid - 1
    else
      min = mid + 1
    end
  end

  return -1
end

# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8], 7)
# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8], 4)
# puts binary_search([1, 2, 3, 4, 5, 6, 7, 8], 9)
# puts binary_search([], 9)