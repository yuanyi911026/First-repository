//
//  tabBarButton.m
//  SecondProject
//
//  Created by xiacheng on 16/7/29.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "tabBarButton.h"

@implementation tabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame imagePath:(NSString *)path {
    self = [super initWithFrame:frame];
    if (self) {
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 40, 40)];
//        
//        UIImage *image = [UIImage imageNamed:path];
//        
//        imageView.image = image;
//        [self addSubview:imageView];
        [self setImage:[UIImage imageNamed:path] forState:UIControlStateNormal];
        
        
    }
    return self;
}

@end
