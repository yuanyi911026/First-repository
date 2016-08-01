//
//  define.h
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/15.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#ifndef define_h
#define define_h


#endif /* define_h */
#ifdef DEBUG //DEBUG = 1
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s",__func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0];

