//
//  ReplaceBlank.m
//  CodingInterview
//
//  Created by Jinya Tu on 2018/7/4.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

#import <Foundation/Foundation.h>

//问题：给定一个字符串，将字符串中的每个空格替换为“%20”。例如输入”We are happy.“则输出“We%20are%20happy.”。

//回答：时间复杂度为O(n)

// capacity为字符数组string的总容量
void replaceBlank(char string[], int capacity) {
    
    if (string == NULL && capacity <= 0) {
        printf("原字符串是空串.\n");
        return;
    }
    
    int oldLength = 0; //字符串长度
    int blankCount = 0; //空格数量
    int i = 0;
    
    printf("原字符串是[%s].\n", string);
    //计算字符串长度和空格数量
    while (string[i] != '\0') {
        ++ oldLength;
        if (string[i] == ' ') {
            ++ blankCount;
        }
        ++ i;
    }
    
    //计算处理后的字符串长度
    int newLength = oldLength + blankCount * 2;
    if (newLength > capacity) {
        printf("处理后字符串长度超出原字符数组的容量.\n");
        return;
    }
    
    //从后往前 依次替换空格
    int indexLeft = oldLength;
    int indexRight = newLength;
    
    while (indexLeft >= 0 && indexLeft < indexRight) {
        if (string[indexLeft] == ' ') {
            string[indexRight --] = '0';
            string[indexRight --] = '2';
            string[indexRight --] = '%';
        }
        else {
            string[indexRight --] = string[indexLeft];
        }
        indexLeft --;
    }
    printf("处理后字符串是[%s].\n", string);
}

//int main(int argc, char * argv[]) {
//    char string[30] = "a b  c d e   ";
//    replaceBlank(string, 30);
//    return 0;
//}

//原字符串是[a b  c d e   ].
//处理后字符串是[a%20b%20%20c%20d%20e%20%20%20].
