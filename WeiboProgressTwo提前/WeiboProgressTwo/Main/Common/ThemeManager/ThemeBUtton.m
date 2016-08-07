
//
//  ThemeBUtton.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ThemeBUtton.h"

@implementation ThemeBUtton
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTheme) name:@"notice" object:nil];
        
    }
    return self;

}
- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    [self changeTheme];
}
- (void)changeTheme {
    
    UIImage *image = [[ThemeManager shareManager]imageForName:_imageName];
    [self setImage:image forState:UIControlStateNormal];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
