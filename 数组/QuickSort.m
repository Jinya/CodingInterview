//
//  QuickSort.m
//  CodingInterview
//
//  Created by Jinya Tu on 2018/7/5.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

#import <Foundation/Foundation.h>

//问题：使用快速排序对给定的数组进行排序
//回答

// 递归方式
// 分析：先在数组中随机选择一个基准数字，接下来把数组中的数字分成两部分，比基准小的移到左边，比基准大的移到右边。然后左边和右边分成的两个子数组递归执行分边操作。

int partition(int data[], int left, int right) {
    if (data == NULL || left < 0 || right <= 0 || left >= right) {
        printf("参数输入有误");
        return 0;
    }
    //选取第一个元素值为基准
    int pivot = data[left];
    
    int low = left;
    int high = right;
    
    while (low < high) {
        //从后面开始遍历，找到第一个小于pivot的元素，放到low位置
        while (low < high && data[high] >= pivot) {
            high--;
        }
        data[low] = data[high];
        
        //从前面开始遍历，找到第一个大于于pivot的元素，放到high位置
        while (low < high && data[low] <= pivot) {
            low++;
        }
        data[high] = data[low];
    }
    
    //此时索引low = high，将基准元素放到此位置，并返回该基准值
    data[low] = pivot;
    return low;
}

//递归调用Partition
void quickSort(int data[], int left, int right) {
    if (left < right) {
        int middle = partition(data, left, right);
        quickSort(data, left, middle-1);
        quickSort(data, middle+1, right);
    }
}

//int main(int argc, char * argv[]) {
//    int data[]= {6,1,2,7,9,3,4,5,10,8};
//    quickSort(data, 0, 9);
//    for (int i = 0; i < 10; i++) {
//        printf("%d ", data[i]);
//    }
//    return 0;
//}
//输入{6,1,2,7,9,3,4,5,10,8}
//输出1 2 3 4 5 6 7 8 9 10

