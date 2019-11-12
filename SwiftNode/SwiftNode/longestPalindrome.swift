//
//  longestPalindrome.swift
//  SwiftNode
//
//  Created by didi on 2019/11/12.
//  Copyright © 2019 didi. All rights reserved.
//

import Foundation
extension String {
    func subStrng(_ startIndex:Int, _ endIndex:Int) -> String {
        let start_i = self.index(self.startIndex,offsetBy: startIndex)
        let end_i = self.index(self.startIndex,offsetBy: endIndex)
        let sub = s[start_i..<end_i]
        return String(sub)
    }
    func subStringIndex(_ startIndex:Int) -> String {
        return self.subStrng(startIndex, startIndex + 1)
    }
}
extension Solution{
    func longestPalindrome(_ s: String) -> String {
        let length = s.count
        guard length > 0 else {
            return ""
        }
        var dp:[[Bool]] = [[Bool]](repeating:([Bool](repeating: false, count:length)) , count: length)
        for j in 0...length {
            dp[j][j] = true
        }
        var maxLength = 1
        var sub_str = s.subStringIndex(0)
        for i in 0...length-2 {
            for distance in 1...length-i {
                let j = i + distance
                let left = s.subStringIndex(i)
                let right  = s.subStringIndex(j)
                if distance == 1 {
                    dp[i][j] = String(left) == String(right)
                }
                else {
                    dp[i][j] = String(left) == String(right) && dp[i + 1] [j - 1]
                }
                if dp[i][j]  {
                    if distance > maxLength {
                        maxLength = distance
                        sub_str = s.subStrng(i, j)
                    }
                }
            }
         }
        return sub_str
        
    }
}
