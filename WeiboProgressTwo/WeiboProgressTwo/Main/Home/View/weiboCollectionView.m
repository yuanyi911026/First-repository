//
//  weiboCollectionView.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/7.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "weiboCollectionView.h"
#import "UIImageView+WebCache.h"
@implementation weiboCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView  numberOfItemsInSection:(NSInteger)section {

    
    return self.imageArry.count;
    

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    
    NSInteger index = indexPath.row;
    if (index <= (self.imageArry.count-1))//为毛会越界？？？？？
    {
        NSDictionary *dic = self.imageArry[indexPath.row];
        NSURL *url = [NSURL URLWithString:dic[@"thumbnail_pic"]];
        UIImageView *imgView = [[UIImageView alloc]init];
        [imgView sd_setImageWithURL:url];
        [cell setBackgroundView:imgView];
    }
    return cell;
}


@end
