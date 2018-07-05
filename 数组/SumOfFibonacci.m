//
//  SumOfFibonacci.m
//  CodingInterview
//
//  Created by Jinya Tu on 2018/7/6.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

#import <Foundation/Foundation.h>

//问题：斐波那契数列求和 f(0) = 0, f(1) = 1, f(n) = f(n-2) + f(n-1)
//回答

// 递归方式 简单粗暴 时间复杂度O(n^2) 可能导致堆栈溢出
long long sumOfFibonacciWithRecursion(unsigned int n) {
    if (n <= 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    return sumOfFibonacciWithRecursion(n-1) + sumOfFibonacciWithRecursion(n-2);
}

//循环
//分析：保存已计算过的f(n-1)和f(n-2)，避免递归式的重复计算
long long sumOfFibonacciWithLoop(unsigned n) {
    if (n <= 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    
    long long f1 = 0;
    long long f2 = 1;
    long long sum = 0;
    
    for (unsigned int i = 2; i <= n; ++i) {
        sum = f1 + f2;
        
        f1 = f2;
        f2 = sum;
    }
    
    return sum;
}

//int main(int argc, char * argv[]) {
//    long long sum = sumOfFibonacciWithLoop(2);
//    printf("sum = %lld\n", sum);
//    return 0;
//}
