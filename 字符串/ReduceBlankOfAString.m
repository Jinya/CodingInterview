//
//  main.m
//  CodingInterview
//
//  Created by Jinya Tu on 2018/7/4.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

//问题：给一个字符串，去掉其首尾空格，并将字符串中连续2个及以上空格减少为1个

//解答：
#include <stdio.h>
void reduceBlank(char string[]) {
    if (string == NULL) {
        printf("原字符串是空串\n");
        return;
    }
    printf("原字符串是[%s]\n", string);
    
    char *p = string;
    int i = 0;
    
    //去掉首部空格
    while (*p == ' ') {
        p = p + 1;
    }
    
    //处理内部多余空格
    while (*p != '\0') {
        string[i] = *p;
        i++;
        p++;
        while (string[i - 1] == ' ' && *p == ' ') {
            p++;
        }
    }
    
    //去掉尾部空格
    if (string[i - 1] == ' ') {
        string[i - 1] = '\0';
    }
    else {
        string[i] = '\0';
    }
    printf("处理后字符串是[%s]\n", string);
}


int main() {
    char string[] = " a  b  c d   e  fg  ";
    reduceBlank(string);
    return 0;
}

//原字符串是[ a  b  c d   e  fg  ]
//处理后字符串是[a b c d e fg]
