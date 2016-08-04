
//
//  ThemeImageView.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/4.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManager.h"
@implementation ThemeImageView

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
- (void)setThemeImageView:(NSString *)themeImageView {
    _themeImageView = themeImageView;
    
    //图片名字一改变,就切换主题
    [self themeChange];
   
    
    
}
- (void)themeChange{
    
    //重新设置图片//themeName
    
    
    UIImage *image = [[ThemeManager shareManager]themeImage:_themeImageView];
    
    
    [self setImage:image];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ThmeChangeNSNotification" object:nil];
    
}

@end
