//
//  WeiboTableView.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/5.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "WeiboTableView.h"
#import "WeiboCell.h"
#import "WeiboLayout.h"

@implementation WeiboTableView
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
      
        
    }
    return self;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.weiboArry.count;
   
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weiboCell" forIndexPath:indexPath];
    
    cell.weiboLay = self.weiboArry[indexPath.row];
  
    
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboLayout *layout = self.weiboArry[indexPath.row];
    CGFloat height = layout.rowHeight;
    return height;
}


@end
