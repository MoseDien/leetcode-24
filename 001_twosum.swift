// https://leetcode.com/problems/two-sum/
// 思路：遍历数组如果目标元素在字典中，则返回其索引，否则将当前元素存入字典
// 关键 - map: [num: index] 
// 算法复杂度: O(n)，也就是一个循环即可解决
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var complementDict: [Int: Int] = [:]
    
    for (index, num) in nums.enumerated() {
        let complement = target - num
        
        if let complementIndex = complementDict[complement] {
            return [complementIndex, index]
        }
        
        complementDict[num] = index
    }
    
    return []
}
