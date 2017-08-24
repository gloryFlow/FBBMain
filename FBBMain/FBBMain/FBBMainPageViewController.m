//
//  FBBMainPageViewController.m
//  FBBMain
//
//  Created by guobingwei on 2017/7/19.
//  Copyright © 2017年 demo. All rights reserved.
//

#import "FBBMainPageViewController.h"
#import <SDHttpClient/HttpMobApi.h>
#import <MGJRouter/MGJRouter.h>
#import "FBBUserSessionDatabase.h"

@interface FBBMainPageViewController ()

@property (nonatomic, strong) UIButton *demoButton;
@property (nonatomic, strong) UIButton *routerButton;
@property (nonatomic, strong) UIButton *userButton;
@property (nonatomic, strong) UIButton *shopRouterButton;

@end

@implementation FBBMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _demoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _demoButton.frame = CGRectMake(100.0, 100.0, 100.0, 50.0);
    _demoButton.backgroundColor = [UIColor cyanColor];
    [_demoButton setTitle:@"获取数据" forState:UIControlStateNormal];
    _demoButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_demoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demoButton addTarget:self action:@selector(demoButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _demoButton.layer.borderWidth = 0.5;
    _demoButton.layer.masksToBounds = YES;
    [self.view addSubview:_demoButton];
    
    _routerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _routerButton.frame = CGRectMake(100.0, 200.0, 100.0, 50.0);
    _routerButton.backgroundColor = [UIColor colorWithRed:0.8 green:0.7 blue:0.65 alpha:1.0];
    [_routerButton setTitle:@"Router跳转" forState:UIControlStateNormal];
    _routerButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_routerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_routerButton addTarget:self action:@selector(routerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _routerButton.layer.borderWidth = 0.5;
    _routerButton.layer.masksToBounds = YES;
    [self.view addSubview:_routerButton];
    
    _shopRouterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shopRouterButton.frame = CGRectMake(100.0, 400.0, 100.0, 50.0);
    _shopRouterButton.backgroundColor = [UIColor cyanColor];
    [_shopRouterButton setTitle:@"Router商家跳转" forState:UIControlStateNormal];
    _shopRouterButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_shopRouterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_shopRouterButton addTarget:self action:@selector(shopRouterButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _shopRouterButton.layer.borderWidth = 0.5;
    _shopRouterButton.layer.masksToBounds = YES;
    [self.view addSubview:_shopRouterButton];
    
    _userButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _userButton.frame = CGRectMake(100.0, 300.0, 100.0, 50.0);
    _userButton.backgroundColor = [UIColor greenColor];
    [_userButton setTitle:@"获取用户数据" forState:UIControlStateNormal];
    _userButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_userButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_userButton addTarget:self action:@selector(userButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _userButton.layer.borderWidth = 0.5;
    _userButton.layer.masksToBounds = YES;
    [self.view addSubview:_userButton];
}


- (void)demoButtonAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"杭州",@"city",
                                   @"浙江",@"province",
                                   @"174d9f1f86365",@"key",
                                   nil];
    
    NSString *url = @"v1/weather/query";
    [HttpMobApi get:url params:params success:^(id responseObj) {
        NSLog(@"responseObj:%@",responseObj);
    } failure:^(HttpError *e) {
        NSLog(@"e:%@",e);
    }];
}

- (void)routerButtonAction {
    [MGJRouter openURL:@"fbb://scheme/userpage?userId=100000"
          withUserInfo:@{@"navigationVC" : self.navigationController}
            completion:nil];
}

- (void)userButtonAction {
    FBBUserSession *session = [[FBBUserSessionDatabase shareInstance] getSessionInfoFromDb];
    NSLog(@"session userId:%@",session.userId);
}

- (void)shopRouterButtonAction {
    [MGJRouter openURL:@"fbb://scheme/shoppage?shopId=21835801"
          withUserInfo:@{@"navigationVC" : self.navigationController}
            completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
