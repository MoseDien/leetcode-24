// implement https://leetcode.com/problems/longest-palindromic-substring/
// 思路：遍历字符串，以当前字符为中心向两边扩展，找到最长的回文子串
// 关键点：回文子串有两种情况，一种是奇数长度，一种是偶数长度
// 时间复杂度：O(n^2)
class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }

        func searchPalindrome(_ chars: [Character], _ l: Int, _ r: Int) {
            var l = l, r = r
        
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
        
            if maxLen < r - l - 1 {
                start = l + 1
                maxLen = r - l - 1
            }
        }
        
        let sChars = Array(s)
        var maxLen = 0, start = 0
        
        for i in 0..<sChars.count {
            searchPalindrome(sChars, i, i)
            searchPalindrome(sChars, i, i + 1)
        }
        
        return String(sChars[start..<start + maxLen])
    }
}