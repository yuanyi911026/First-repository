//
//  WeiboCell.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "WeiboCell.h"

#import "UIImageView+WebCache.h"
#import "Header.h"
#import "WeiboLayout.h"
#import "WeiboModel.h"
#import "weiboCollectionView.h"
@implementation WeiboCell
/*
 @property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
 @property (weak, nonatomic) IBOutlet UILabel *timeLabel;
 @property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *photoImage;
 
 
 */
- (void)awakeFromNib {
    // Initialization code
}
- (weiboCollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 7.5;
        flowLayout.itemSize = CGSizeMake(95,95);
        flowLayout.minimumInteritemSpacing = 7.5;
        

        _collectionView = [[weiboCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        
        [self.contentView addSubview:_collectionView];
        
    }
    return _collectionView;
}
- (UIImageView *)weiboImgView {
    if (_weiboImgView == nil) {
        _weiboImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
       
#warning 当有转发的时候需要改到添加到背景图片
        [self.contentView addSubview:_weiboImgView];
        
    }
    return _weiboImgView;
}

- (UILabel *)weiboLabel{
    if (_weiboLabel == nil) {
        _weiboLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _weiboLabel.font = [UIFont systemFontOfSize:15];
        _weiboLabel.layer.cornerRadius = 5;
        _weiboLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _weiboLabel.numberOfLines = 0;
        _weiboLabel.layer.masksToBounds = YES;
        [self.contentView addSubview:_weiboLabel];
    }
    return _weiboLabel;
}
- (void)setWeiboLay:(WeiboLayout *)weiboLay {
    _weiboLay = weiboLay;
    
  
   
    _sourceLabel.text = weiboLay.weiboModel.source;
    _timeLabel.text = weiboLay.weiboModel.created_at;
    _nickNameLabel.text =  weiboLay.weiboModel.user.screen_name;
    NSString *url = weiboLay.weiboModel.user.profile_image_url;
    [_photoImage sd_setImageWithURL:[NSURL URLWithString:url]];
    self.weiboLabel.text = weiboLay.weiboModel.text;
    self.weiboLabel.frame = weiboLay.weiboTextFrame;
    /*
    if (weiboLay.weiboModel.thumbnail_pic) {
        [self.weiboImgView sd_setImageWithURL:[NSURL URLWithString:weiboLay.weiboModel.thumbnail_pic]];
        _weiboImgView.frame = weiboLay.weiboImageViewFrame;
      
        
    }else{
        self.weiboImgView.image = nil;
    }
    */
    
        self.collectionView.imageArry = weiboLay.weiboModel.pic_urls;
        self.collectionView.frame = weiboLay.collectionViewFrame;
    
   
//[self.collectionView reloadData];
    

}
/*
- (void)setWeiboModel:(WeiboModel *)weiboModel {
    _weiboModel = weiboModel;
    _sourceLabel.text = weiboModel.source;
    _timeLabel.text = weiboModel.created_at;
    _nickNameLabel.text = weiboModel.user.screen_name;
    NSString *url = weiboModel.user.profile_image_url;
    [_photoImage sd_setImageWithURL:[NSURL URLWithString:url]];
    self.weiboLabel.text = weiboModel.text;
    CGRect rect = [weiboModel.text boundingRectWithSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    self.weiboLabel.frame = CGRectMake(10,CGRectGetMaxY(self.photoImage.frame)+20, kScreenWidth-20, rect.size.height);
}
 */

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
