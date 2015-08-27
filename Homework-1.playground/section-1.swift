// Homework 1
import Foundation

// The generateArray function randomly creates an array of Int optionals
// The following questions ask you to perform different calculations based
// on random arrays created by the function. Each time you run the playground
// you should get different results. You can force the playground to run again
// using the Editor --> Execute Playground menu item.
func generateArray() -> [Int?] {
    let size = Int(arc4random() % 20)
    var array = [Int?]()
    var value: Int?
    
    for i in 0...size {
        value = -10 + Int(arc4random() % 110)
        array.append(value >= 0 ? value : nil)
    }
    
    return array
}
// Question 1: Counting nils
//
// Write code that counts the number of nil values in array1
let array1 = generateArray()
func countNils(array: [Int?]) -> Int {
    var count = 0

    for i in array {
        if i == nil { count++ }
    }

    return count
}
// Question 2: Mean
//
// Write code that calculates the mean value of the non nil elements in array1.
// You do not necessarily need to write functions. You can start your code
// directly under the declaration of array2
let array2 = generateArray()
func findMeanOfArray(array: [Int?]) -> Int{
    var total = 0

    for (var i = 0; i < array.count; i++) {
        if let value = array[i] {
            total += value
        }
    }

    return total / array.count
}
// Question 3: New Array
//
// Write code that creates a new array named nilFree that has the same elements
// as array3, except without the nil values. The elements in nilFree should be
// Ints, not Int optionals
let array3 = generateArray()

func removeNils(array: [Int?]) -> [Int]{
    var cleanArray = [Int]()

    for i in 0...(array.count - 1) {
        if let value = array[i] {
            cleanArray.append(value)
        }
    }

    return cleanArray
}

// Question 4: Sort array
//
// Write code that will sort array4 using your own logic. You might want to
// review the logic for Selection Sort or even Bubble Sort. Find a sort
// algorithm that you like in a language that you are familiar with and then
// translate it to Swift. Resist the temptation to find a sort online that
// is already written in swift. Do not use Swift's sort method.
let array4 = generateArray()
func merge(left: [Int], right: [Int]) -> [Int] {
    var sorted = [Int]()
    var rightCount = right.count
    var leftCount = left.count
    var rightIndex = 0
    var leftIndex = 0

    while rightIndex < rightCount && leftIndex < leftCount {
        var leftval: Int = left[leftIndex]
        var rightval: Int = right[rightIndex]
        if leftval < rightval {
            sorted.append(leftval)
            leftIndex++
        } else {
            sorted.append(rightval)
            rightIndex++
        }
    }
    
    sorted += left[leftIndex..<leftCount] + right[rightIndex..<rightCount]
    return sorted
}

func mergeSort(array: [Int]) -> [Int] {
    if array.count == 1 {
        return array
    }
    var midPoint = array.count/2
    var left = Array(array[0..<midPoint])
    var right = Array(array[midPoint..<(array.count)])
    return merge(mergeSort(left), mergeSort(right))
}

var sorted = mergeSort(removeNils(array4))
