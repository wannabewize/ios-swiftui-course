/*
 *  복합 구조
 */

// 2차원 배열
// [[String]]
var twoDimensionArray: [[String]] = [["a", "b"], ["c", "d", "e"], ["f"]]
let itemArray: [String] = twoDimensionArray[1]; // ["c", "d", "e"]
let itme: String = twoDimensionArray[1][2] // "d"
print(itemArray)
print(twoDimensionArray[1][1])


// 배열과 딕셔너리 혼합
//
// [String, [Int]]
let evenNums = [2, 4, 6]
let oddNums = [1, 3, 5, 7]
let dic: [String: [Int]] = ["even" : evenNums, "odd" : oddNums] // Dictionary<String, [Int]>, [String, Any]

// [1, 3, 5, 7]
if let oddNumbers = dic["odd"] {
    let oddNum = oddNumbers[2] // 5
    print(oddNumbers)
    print(oddNum)
}
else {
    fatalError("WHAT!!")
}
    
