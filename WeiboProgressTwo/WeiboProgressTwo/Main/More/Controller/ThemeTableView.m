
//
//  ThemeTableView.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/4.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ThemeTableView.h"
#import "ThemeManager.h"

@interface ThemeTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL status[30];//最好放到manager里面，不设置固定的数字，以后再改
}
@property (nonatomic,strong) NSMutableDictionary *dict;
@end

@implementation ThemeTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dict =  [ThemeManager shareManager].themeNameDict;
    self.tableView.rowHeight = 40;
    

    
    
    
    
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dict.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
   UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    NSArray *arry = [_dict allValues];
    
    NSString *path = arry[indexPath.row];
    NSString *str = [path stringByAppendingPathComponent:@"more_icon_theme"];
    NSString *filePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:str];
    imgView.image = [UIImage imageWithContentsOfFile:filePath];
    
    [cell.contentView addSubview:imgView];
    
    
    NSArray *arry1 = [_dict allKeys];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(250, 0, 70, 40)];
    label.text = arry1[indexPath.row];
    [cell.contentView addSubview:label];
    if (status[indexPath.row] == YES){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [_dict allKeys];
    
    [ThemeManager shareManager].themeName = array[indexPath.row];
    
       
    status[indexPath.row] = YES;
    [tableView reloadData];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
