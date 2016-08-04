//
//  ThemeManager.h
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/4.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ThemeManager : NSObject
+ (instancetype)shareManager;
@property (nonatomic,copy)NSString * themeName;
@property (nonatomic,copy)NSString * themeColorName;
@property (nonatomic,strong) NSMutableDictionary *themeNameDict;
- (NSString *)themePath;
- (UIImage *)themeImage:(NSString *)imageName;
- (UIColor *)themeColor:(NSString *)colorName;
@end
