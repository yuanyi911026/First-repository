//
//  ThemeManager.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/4.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ThemeManager.h"
@interface ThemeManager()
{
    
    NSMutableDictionary *themeColorDict;
}
@end

@implementation ThemeManager
+ (instancetype)shareManager {
    static ThemeManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}
- (instancetype)init {
    self = [super init];
    if  (self) {
        //防止循环引用
      
        
        _themeName = @"猫爷";
       
    }
    return  self;
}
- (void)setThemeName:(NSString *)themeName{
    _themeName = themeName;
    //发送通知
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ThmeChangeNSNotification" object:nil];
    
     NSArray *arry = @[[ThemeManager shareManager].themeName];
     [[NSUserDefaults standardUserDefaults] setObject:arry forKey:@"themeName"];
     [[NSUserDefaults standardUserDefaults] synchronize];
    

    themeColorDict = nil;
}

- (NSString *)themePath {
    if (_themeNameDict == nil) {
        _themeNameDict = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"ThemeName" ofType:@"plist" ]];
    }
    NSString *themeTitle = [_themeNameDict objectForKey:_themeName];
    return   [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:themeTitle];
}
- (UIImage *)themeImage:(NSString *)imageName {
    NSString *themeImagePath = [self.themePath stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:themeImagePath];
    return image;
}




- (UIColor *)themeColor:(NSString *)colorName {
    
    if (themeColorDict == nil) {
        NSString *filePath = [self.themePath stringByAppendingPathComponent:@"config.plist"];
        themeColorDict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    }
    NSDictionary *dict = themeColorDict[colorName];
    CGFloat r = [dict[@"R"] floatValue];
    CGFloat g = [dict[@"G"] floatValue];
    CGFloat b = [dict[@"B"] floatValue];
    CGFloat alpha = dict[@"alpha"]? [dict[@"alpha"] floatValue ]:1;
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:alpha];
}

@end
