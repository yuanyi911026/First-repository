//
//  HomeViewController.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/3.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "ThemeManager.h"
#import "ThemeLabel.h"
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
   
    //由于 NSNotification是先add再post,所以要想调用add才能初始化
    [ThemeManager shareManager].themeName = @"猫爷";
}


//保存认证数据
- (void)storeAuthData
{
    SinaWeibo *sinaweibo = [self sinaweibo];
    
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


//登陆调用的代理方法
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo{
    
    //请求网络数据
    [self storeAuthData];
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
