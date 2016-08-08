
//
//  WeiboLayout.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/6.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "WeiboLayout.h"
#import "Header.h"
#import "WeiboModel.h"
#define kCellHeight 60
#define kSpace 10

@implementation WeiboLayout
- (void)setWeiboModel:(WeiboModel *)weiboModel{
    
    //计算frame
    _weiboModel = weiboModel;
    
    self.rowHeight  = kCellHeight;
    
    //确定单元格每个子视图的frame
    //(1)计算微博正文所占用的空间(高)
    CGRect textrect = [self.weiboModel.text boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:16]} context:NULL];
    
    //微博正文的frame
    self.weiboTextFrame = CGRectMake(kSpace, kCellHeight+kSpace , kScreenWidth - 20, textrect.size.height);
    
    /*
    if (self.weiboModel.thumbnail_pic) {
        self.weiboImageViewFrame = CGRectMake(kSpace, CGRectGetMaxY(self.weiboTextFrame), 100, 100);
    }else {
        self.weiboImageViewFrame = CGRectZero;
    }
    */
    if (self.weiboModel.pic_urls.count!=0) {
        NSInteger row = (self.weiboModel.pic_urls.count-1)/3;
        self.collectionViewFrame = CGRectMake(kSpace, CGRectGetMaxY(self.weiboTextFrame), 300, 100*(row+1));
    }else {
        self.collectionViewFrame = CGRectZero;
    }
    
    
    //更新单元格的高度
    
    self.rowHeight += CGRectGetHeight(self.weiboTextFrame)+kSpace+CGRectGetHeight(self.collectionViewFrame)+kSpace;
    
    
    
    
    
    
    
    
    
    
}




@end
