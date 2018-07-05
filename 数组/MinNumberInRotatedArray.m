//
//  MinNumberInRotatedArray.m
//  CodingInterview
//
//  Created by Jinya Tu on 2018/7/6.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

#import <Foundation/Foundation.h>

//问题：输入一个递增数组的一个旋转，输出数组中的最小元素。把一个数组最开始的若干元素移到数组的末尾，称之为数组的旋转。例如{3,4,5,1,2}为{1,2,3,4,5}的一个旋转，最小元素是1。
//回答

//分析：二分法



int getMin(int data[], int length) {
    if (length <= 0 || data == NULL) {
        printf("输入的数组有误");
        return -1;
    }
    
    int left = 0;
    int right = length - 1;
    int mid = left;
    
    while (data[left] >= data[right]) {
        
        if ((right - left) == 1) {
            //数组只有两个元素，直接返回其中较小的
            return data[right];
        }
        
        mid = (left + right) / 2;
        
        //如果三个位置left mid right的元素值是相同的，无法缩小二分区间，直接通过遍历返回其中最小值
        if (data[left] == data[mid] && data[mid] == data[right]) {
            int result = data[left];
            for (int i = result + 1; i <= right; ++i) {
                if (result > data[i]) {
                    result = data[i];
                }
            }
            return result;
        }
        
        //二分法缩小区间
        if (data[mid] >= data[left]) {
            left = mid;
        }
        else if (data[mid] <= data[right]) {
            right = mid;
        }
        
    }
    
    return data[mid];
}

int main(int argc, char * argv[]) {
    int array[] = {3,4,5,1,2};
    int result = getMin(array, 5);
    printf("min = %d\n", result);

    return 0;
}
