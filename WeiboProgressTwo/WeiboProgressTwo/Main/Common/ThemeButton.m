//
//  ThemeButton.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/4.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"
@implementation ThemeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeChange) name:@"ThmeChangeNSNotification" object:nil];
    }
    return self;
}
- (void)setThemeButtonImage:(NSString *)themeButtonImage {
    _themeButtonImage = themeButtonImage;
    
    //图片名字一改变,就切换主题
    
   


}
- (void)themeChange{
    
    //重新设置图片//themeName
    
   
    UIImage *image = [[ThemeManager shareManager]themeImage:_themeButtonImage];
    
    
    [self setImage:image forState:UIControlStateNormal];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ThmeChangeNSNotification" object:nil];
    
}

@end
