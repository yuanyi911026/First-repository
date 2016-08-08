//
//  weiboCollectionView.h
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/7.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weiboCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSArray *imageArry;

@end
