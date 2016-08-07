//
//  WeiboLayout.h
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/6.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WeiboModel;

@interface WeiboLayout : NSObject
@property (nonatomic,assign)CGFloat  rowHeight;
@property (nonatomic,assign)CGRect weiboTextFrame;
@property (nonatomic,strong)WeiboModel *weiboModel;

@property (nonatomic,assign)CGRect weiboImageViewFrame;
@end
