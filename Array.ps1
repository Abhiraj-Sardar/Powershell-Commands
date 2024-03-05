# Define an array of numbers
$numbers = 1, 2, 3, 4, 5

# 1. Accessing elements by index
Write-Host "1. Accessing elements by index:"
Write-Host "First element: $($numbers[0])"
Write-Host "Third element: $($numbers[2])"
Write-Host "Last element: $($numbers[-1])"  # Negative index accesses elements from the end

# 2. Adding elements to the array
Write-Host "`n2. Adding elements to the array:"
$numbers += 6
$numbers += 7, 8, 9
Write-Host "Array after adding elements: $($numbers -join ', ')"

# 3. Removing elements from the array
Write-Host "`n3. Removing elements from the array:"
$numbers = $numbers | Where-Object { $_ -ne 4 }
Write-Host "Array after removing element 4: $($numbers -join ', ')"

# 4. Finding the length of the array
Write-Host "`n4. Finding the length of the array:"
$length = $numbers.Count
Write-Host "Length of the array: $length"

# 5. Sorting the array
Write-Host "`n5. Sorting the array:"
$sortedNumbers = $numbers | Sort-Object
Write-Host "Sorted array: $($sortedNumbers -join ', ')"

# 6. Reversing the array
Write-Host "`n6. Reversing the array:"
$reversedNumbers = $numbers | Sort-Object -Descending
Write-Host "Reversed array: $($reversedNumbers -join ', ')"

# 7. Checking if an element exists in the array
Write-Host "`n7. Checking if an element exists in the array:"
$containsThree = $numbers -contains 3
Write-Host "Does the array contain 3? $containsThree"

# 8. Finding the index of an element
Write-Host "`n8. Finding the index of an element:"
$index = $numbers.IndexOf(5)
Write-Host "Index of 5: $index"

# 9. Clearing the array
Write-Host "`n9. Clearing the array:"
$numbers = @()
Write-Host "Array after clearing: $($numbers -join ', ')"
