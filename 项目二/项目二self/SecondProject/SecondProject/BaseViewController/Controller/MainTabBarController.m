//
//  MainTabBarController.m
//  SecondProject
//
//  Created by xiacheng on 16/7/29.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "MainTabBarController.h"
#import "tabBarButton.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *firStory = [UIStoryboard storyboardWithName:@"First" bundle:nil];
    UIViewController *fir = [firStory instantiateInitialViewController];
    
    UIStoryboard *secStory = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    UIViewController *sec = [secStory instantiateInitialViewController];
    
    UIStoryboard *thiStory = [UIStoryboard storyboardWithName:@"Third" bundle:nil];
    UIViewController *thi = [thiStory instantiateInitialViewController];
    
    UIStoryboard *fouStory = [UIStoryboard storyboardWithName:@"Fourth" bundle:nil];
    UIViewController *fou = [fouStory instantiateInitialViewController];
    
    UIStoryboard *fivStory = [UIStoryboard storyboardWithName:@"Fiveth" bundle:nil];
    UIViewController *fiv = [fivStory instantiateInitialViewController];
    
    self.viewControllers = @[fir,sec,thi,fou,fiv];
    
    
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self _removeTabBarButton];
}
- (void)_removeTabBarButton{
    for (UIView *view in self.tabBar.subviews) {
        
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    //标题数组
    NSArray *arry = @[
                     @"home_tab_icon_1",
                     @"home_tab_icon_2",
                     @"home_tab_icon_3",
                     @"home_tab_icon_4",
                     @"home_tab_icon_5"
                     ];
    for (NSInteger i = 0; i<5; i++) {
       tabBarButton *tabBar = [[tabBarButton alloc]initWithFrame:CGRectMake(i*kScreenWidth/5, 0, kScreenWidth/5, 49) imagePath:arry[i]];
        tabBar.tag = i+100;
        [self.tabBar addSubview:tabBar];
        [tabBar addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
        }
}
- (void)changeView:(tabBarButton *)button{
    self.selectedIndex = button.tag-100;
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
