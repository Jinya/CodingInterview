//
//  ClockwiselyPrintMatrix.m
//  CodingInterview
//
//  Created by Jinya Tu on 2018/7/5.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

#import <Foundation/Foundation.h>

//问题：顺时针打印一个矩阵(二维数组)
//回答
//C语言

//分析：
//将矩阵划分成多个完整回环
//最后一个回环可能恰好是一个完整回环，也可能恰好仅剩一行，也可能恰好仅剩一列，也可能恰好仅剩一个...


//打印一个回环 start是每个回环的起始位置
void printCircle(int rows, int columns, int start, int matrix[rows][columns]) {
    
    //回环的起始坐标
    int startRow = start;
    int startColumn = start;
    
    //获取这个回环的最后一个位置
    int endColumn = columns - 1 - start;
    int endRow = rows - 1 - start;
    
    //从左到右打印一行
    for (int i = startColumn; i <= endColumn; ++i) {
        int number = matrix[startRow][i];
        printf("%d ", number);
    }
    
    //从上到下打印一列
    if (endRow > startColumn) {
        for (int i = startRow+1; i <= endRow; ++i) {
            int number = matrix[i][endColumn];
            printf("%d ", number);
        }
    }
    
    //从右往左打印一行
    if (endRow > startRow && endColumn > startColumn) {
        for (int i = endColumn-1; i >= startColumn; --i) {
            int number = matrix[endRow][i];
            printf("%d ", number);
        }
    }
    
    //从下往上打印一行
    if (endRow-1 > startRow && endColumn > startColumn) {
        for (int i = endRow-1; i > startRow; --i) {
            int number = matrix[i][startColumn];
            printf("%d ", number);
        }
    }
    
}

void printMatrixClockwisely(int rows, int columns, int matrix[rows][columns]) {
    
    if (matrix == NULL || rows <= 0 || columns <= 0) {
        printf("这是一个空矩阵.");
    }
    
    int start = 0; //每个回环的起始位置（X与Y值相同）
    
    while (rows > start * 2 && columns > start * 2) {
        
        //打印一个环
        printCircle(rows, columns, start, matrix);
        
        //移动起始坐标
        ++ start;
    }
}

//int main(int argc, char * argv[]) {
//    int matrix[][5]= {
//        {1,2,3,4,5},
//        {16,17,18,19,6},
//        {15,24,25,20,7},
//        {14,23,22,21,8},
//        {13,12,11,10,9}
//    };
//    printMatrixClockwisely(5, 5, matrix);
//    return 0;
//}
//输出 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25



