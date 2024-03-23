// implement findMedianSortedArrays of https://leetcode.com/problems/median-of-two-sorted-arrays/
// 思路：将两个有序数组合并成一个有序数组，然后根据数组长度的奇偶性返回中位数
// 关键点：合并两个有序数组
func findMedianSortedArrays_v1(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let m = nums1.count
    let n = nums2.count
    let total = m + n
    var i = 0
    var j = 0
    var merged: [Int] = []
    
    while i < m && j < n {
        if nums1[i] < nums2[j] {
            merged.append(nums1[i])
            i += 1
        } else {
            merged.append(nums2[j])
            j += 1
        }
    }
    // append the rest of nums1 or nums2 if one of them is not empty
    while i < m {
        merged.append(nums1[i])
        i += 1
    }
    while j < n {
        merged.append(nums2[j])
        j += 1
    }
    
    if total % 2 == 0 {
        return Double(merged[total / 2] + merged[total / 2 - 1]) / 2
    } else {
        return Double(merged[total / 2])
    }
}

// 优化：不需要合并两个数组, 只需要找到中位数的位置即可
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let m = nums1.count
    let n = nums2.count
    let total = m + n

    var median1 = -1, median2 = -1 // index of median1 and median2
    if total % 2 == 1 {
        median1 = (total - 1) / 2
    } else {
        median1 = total / 2 - 1
        median2 = median1 + 1
    }
    let maxMedian = max(median1, median2)

    var i = 0
    var j = 0
    var count = 0
    var current = 0
    var previous = 0
    
    while i < m || j < n {
        if i < m && (j >= n || nums1[i] <= nums2[j]) {
            current = nums1[i]
            i += 1
        } else {
            current = nums2[j]
            j += 1
        }
        
        if count == maxMedian {
            if median2 == -1 {
                return Double(current)
            } else {
                return Double(previous + current) / 2
            }
        }
        
        previous = current
        count += 1
    }
    
    return 0.0
}