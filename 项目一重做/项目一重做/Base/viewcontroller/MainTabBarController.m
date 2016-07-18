//
//  MainTabBarController.m
//  项目一重做
//
//  Created by xiacheng on 16/7/17.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏背景
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    [self  _loadController];
    // Do any additional setup after loading the view.
}
-(void)_loadController{
    UIStoryboard  *cinemaStory = [UIStoryboard storyboardWithName:@"Cinema" bundle:nil];
    UIViewController *cinema = [cinemaStory  instantiateInitialViewController];
    UIStoryboard  *northStory = [UIStoryboard storyboardWithName:@"North" bundle:nil];
    UIViewController *north = [northStory  instantiateInitialViewController];
    UIStoryboard  *topStory = [UIStoryboard storyboardWithName:@"Top" bundle:nil];
    UIViewController *top = [topStory  instantiateInitialViewController];
    UIStoryboard  *moreStory = [UIStoryboard storyboardWithName:@"More" bundle:nil];
    UIViewController *more = [moreStory  instantiateInitialViewController];
    UIStoryboard  *newsStory = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    UIViewController *news = [newsStory  instantiateInitialViewController];
   
    self.viewControllers = @[north,news,top,cinema,more];
    
 


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
