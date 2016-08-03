//
//  HomeViewController.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/3.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
@interface HomeViewController ()<SinaWeiboDelegate>

@end

@implementation HomeViewController
//获取新浪微博对象
- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置代理,用来监听登陆成功的事件
    
    SinaWeibo *sinaWeibo= [self sinaweibo];
    
    [sinaWeibo setDelegate:self];
    
    
    [sinaWeibo logIn];

    // Do any additional setup after loading the view.
}
//登陆调用的代理方法
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo{
    
    //请求网络数据
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
