//
//  WeiboCell.h
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeiboLayout;
@interface WeiboCell : UITableViewCell
@property (nonatomic,strong)  WeiboLayout *weiboLay;
//@property (nonatomic,strong) WeiboModel *weiboModel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (nonatomic,strong) UILabel *weiboLabel;
@property (nonatomic,strong)UIImageView *weiboImgView;
@property (nonatomic,strong)UIImageView *backgroundImgView;
@end
