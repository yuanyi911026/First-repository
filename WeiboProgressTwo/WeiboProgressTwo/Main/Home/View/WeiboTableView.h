//
//  WeiboTableView.h
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiboTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *weiboArry;
@end
