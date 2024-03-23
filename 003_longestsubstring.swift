// implement longestSubstring of https://leetcode.com/problems/longest-substring-without-repeating-characters/
/**
 * 思路：遍历字符串，如果字符不在字典中则存入字典，否则更新起始位置为当前字符的下一个位置
 * 每次遍历都更新最大长度
 * 关键点：起始位置的更新，字典存储字符的位置
 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    var charDict: [Character: Int] = [:]
    var maxLength = 0
    var start = 0
    
    for (index, char) in s.enumerated() {
        if let charIndex = charDict[char] {
            start = max(start, charIndex + 1)
        }
        
        maxLength = max(maxLength, index - start + 1)
        charDict[char] = index
    }
    
    return maxLength
}