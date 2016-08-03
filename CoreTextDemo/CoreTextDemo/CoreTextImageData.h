//
//  CoreTextImageData.h
//  CoreTextDemo
//
//  Created by xiacheng on 16/8/1.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreTextImageData : NSObject
@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) NSUInteger position;
// 此坐标是 CoreText 的坐标系，而不是UIKit的坐标系
@property (nonatomic) CGRect imagePosition;

@end
