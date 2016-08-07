//
//  ThemeManager.h
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ThemeManager : NSObject
+ (instancetype)shareManager;
@property (nonatomic,strong)NSString *themeName;
- (UIImage *)imageForName:(NSString *)imageName;
@end
