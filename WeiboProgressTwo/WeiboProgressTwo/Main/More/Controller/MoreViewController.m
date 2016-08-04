//
//  MoreViewController.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/3.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "MoreViewController.h"
#import "ThemeImageView.h"
#import "ThemeLabel.h"
#import "ThemeManager.h"


@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet ThemeImageView *themeImage;
@property (weak, nonatomic) IBOutlet ThemeImageView *managerImage;
@property (weak, nonatomic) IBOutlet ThemeImageView *adviceImage;
@property (weak, nonatomic) IBOutlet ThemeLabel *themeLabel;
@property (weak, nonatomic) IBOutlet ThemeLabel *managerLabel;
@property (weak, nonatomic) IBOutlet ThemeLabel *adviceLabel;
@property (weak, nonatomic) IBOutlet ThemeLabel *themeNameLabel;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self themeChange];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeChange) name:@"ThmeChangeNSNotification" object:nil];
    }
    return self;
    
}
- (void)themeChange {
    _themeImage.themeImageView =  @"more_icon_theme";
    _themeLabel.colorName = @"More_Item_Text_color";
    _managerLabel.colorName = @"More_Item_Text_color";
    _adviceLabel.colorName = @"More_Item_Text_color";
    _themeNameLabel.colorName = @"More_Item_Text_color";
    
    UIColor *color =  [[ThemeManager shareManager]themeColor:@"More_Item_color"];
    self.tableView.backgroundColor = color;
    UIColor *lineColor =  [[ThemeManager shareManager]themeColor:@"More_Item_Line_color"];
    self.tableView.separatorColor = lineColor;
    _themeNameLabel.text = [ThemeManager shareManager].themeName;
    
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ThmeChangeNSNotification" object:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
         
    if (indexPath.section == 2 && indexPath.row == 1) {
       UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:@"是否清楚缓存" preferredStyle:UIAlertControllerStyleAlert];
       [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
       [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self clearCache];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (void)clearCache {
    //获取缓存路径
    NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSLog(@"%@",filePath);
    //清除缓存
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
