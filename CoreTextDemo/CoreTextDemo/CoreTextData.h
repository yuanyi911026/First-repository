//
//  CoreTextData.h
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/15.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextImageData.h"
@interface CoreTextData : NSObject
@property (assign,nonatomic) CTFrameRef ctFrame;
@property (assign,nonatomic) CGFloat  height;
@property (strong,nonatomic) NSMutableArray *imageArry;
@end
