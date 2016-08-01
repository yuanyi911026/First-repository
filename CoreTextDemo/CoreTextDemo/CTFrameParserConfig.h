//
//  CTFrameParserConfig.h
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/15.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTFrameParserConfig : NSObject
@property (assign,nonatomic) CGFloat width;
@property (assign,nonatomic) CGFloat fontSize;
@property (assign,nonatomic) CGFloat lineSpace;
@property (strong,nonatomic) UIColor *textColor;


@end
