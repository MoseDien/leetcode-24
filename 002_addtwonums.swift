// implement addTwoNumbers of https://leetcode.com/problems/add-two-numbers/
/**
* 思路：遍历链表，将当前节点的值相加，如果有进位则加上进位，
* 将和的个位数作为新节点的值，进位数作为下一次相加的进位，直到两个链表都遍历完
* 性能：时间复杂度O(max(m, n))，m和n分别是两个链表的长度
* 也是一个循环即可解决
*/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var dummy = ListNode(0) // dummy node - 不存储值，只是为了方便操作
        var current = dummy
        var p = l1, q = l2
        
        while p != nil || q != nil {
            let sum = carry + (p?.val ?? 0) + (q?.val ?? 0)
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            
            if p != nil {
                p = p?.next
            }
            
            if q != nil {
                q = q?.next
            }
        }
        
        if carry > 0 {
            current.next = ListNode(carry)
        }
        
        return dummy.next
    }
}