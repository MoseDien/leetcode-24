import Foundation

// 1. 字符串长度
let str: String = "Hello, Swift!"
print(str.count) 

// 2.1 字符串遍历 - Character - unicode
for c: Character in str {
    print(c) 
}

// 2.2 字符串遍历，获取索引和字符 - 完整的表达
for (index, c): (Int, Character) in str.enumerated() {
    print("index: \(index), char: \(c)")
}

// 3. 字符串截取 - 使用sdk的下标
let startIndex: String.Index = str.index(str.startIndex, offsetBy: 7)
let endIndex: String.Index = str.index(str.startIndex, offsetBy: 12)
let subStr: Substring = str[startIndex..<endIndex]
print(subStr) // Swift

// 4. String get Characters. Before swift4: str.characters
let characters: Array<Character> = Array(str)
print(characters)

// 5. separatedBy
let string1 = "1;2;3"
let array1 = string1.components(separatedBy: ";")
print(array1)

// 6. joined
let array2 = ["Andrew", "Ben", "John", "Paul", "Peter", "Laura"]
let joined2: String = array2.joined(separator: ", ")
print(joined2)