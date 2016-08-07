
//
//  ThemeManager.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ThemeManager.h"

@interface ThemeManager()
@property (nonatomic,strong)NSMutableDictionary *plistDic;
@end

@implementation ThemeManager
+ (instancetype)shareManager {
    static ThemeManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:nil];
    });
    return instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
   return  [self shareManager];
}
- (NSString *)path{
   NSString *listpath = [[NSBundle mainBundle]pathForResource:@"Common" ofType:@"plist"];
    if (_plistDic == nil) {
    _plistDic = [NSMutableDictionary dictionaryWithContentsOfFile:listpath];
    }
    NSString *filePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[_plistDic objectForKey:_themeName]];
    return filePath;
}
- (void)setThemeName:(NSString *)themeName {
    _themeName = themeName;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notice" object:nil];
}
- (UIImage *)imageForName:(NSString *)imageName {
    NSString *ImagePath = [self.path stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:ImagePath];
    return image;
}




@end
