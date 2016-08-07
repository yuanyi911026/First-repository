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
#import "WeiboModel.h"
#import "YYModel.h"
#import "WeiboTableView.h"
#import "WeiboLayout.h"
@interface HomeViewController ()<SinaWeiboDelegate,SinaWeiboRequestDelegate>
@property (nonatomic,strong)NSMutableArray *weiboList;
@property (weak, nonatomic) IBOutlet WeiboTableView *weiboTableView;

@end

@implementation HomeViewController
- (NSMutableArray *)weiboList {
    if (_weiboList == nil) {
        _weiboList = [NSMutableArray array];
    }
    return _weiboList;
}

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
    //[ThemeManager shareManager].themeName = @"猫爷";
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
    [sinaweibo requestWithURL:@"statuses/home_timeline.json?access_token=2.00bvfj7G0Gc6lH181b9612d8Q8Bv4C" params:nil httpMethod:@"GET" delegate:self];
    

}

//接收到请求
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result {
   
    NSArray *statuses = result[@"statuses"];
    for (NSDictionary *status in statuses) {
        
        WeiboModel *weiboModel = [WeiboModel yy_modelWithDictionary:status];
        
        
        
        WeiboLayout *layout = [[WeiboLayout alloc]init];
        layout.weiboModel = weiboModel;
        
        [self.weiboList addObject:layout];
    }
    
    self.weiboTableView.weiboArry = self.weiboList;
   [self.weiboTableView reloadData];
}
//重名解决

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
