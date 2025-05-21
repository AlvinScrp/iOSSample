//
//  AppDelegate.m
//  test7
//
//  Created by canglong on 2025/5/21.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 首先设置 window 和背景色
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    // 设置初始根视图控制器
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    // 创建临时启动视图
    UIView *launchView = [[UIView alloc] initWithFrame:self.window.bounds];
    launchView.backgroundColor = [UIColor whiteColor];
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LaunchImage"]];
    logo.center = launchView.center;
    [launchView addSubview:logo];
    
    
    
    // 添加启动视图
    [self.window addSubview:launchView];
    
    // 延迟移除启动图
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [launchView removeFromSuperview];
        ViewController *mainVc = [[ViewController alloc] init];
        self.window.rootViewController = mainVc;
    });
    
    return YES;
}

@end
