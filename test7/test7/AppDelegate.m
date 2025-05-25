//
//  AppDelegate.m
//  test7
//
//  Created by canglong on 2025/5/21.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NewsViewController.h"
#import "RecommendViewController.h"
#import "VideoViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

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
    
    UIView *launchView = [self  addLaunchView];
    
    // 延迟移除启动图
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [launchView removeFromSuperview];
        [self loadMainViewController];
    });
    
    return YES;
}
-(UIView * ) addLaunchView{
    // 创建临时启动视图
    UIView *launchView = [[UIView alloc] initWithFrame:self.window.bounds];
    launchView.backgroundColor = [UIColor whiteColor];
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LaunchImage"]];
    logo.center = launchView.center;
    [launchView addSubview:logo];
    
    // 添加启动视图
    [self.window addSubview:launchView];
    return  launchView;
}

- (void) loadMainViewController{
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    NewsViewController * newsVc = [[NewsViewController alloc] init];
    newsVc.tabBarItem.title=@"News";
    newsVc.tabBarItem.image=[UIImage imageNamed:@"home"];
    newsVc.tabBarItem.selectedImage =[UIImage imageNamed:@"home_selected"];
    
    RecommendViewController * recommendVc = [[RecommendViewController alloc] init];
    recommendVc.tabBarItem.title=@"Recommend";
    recommendVc.tabBarItem.image=[UIImage imageNamed:@"like"];
    recommendVc.tabBarItem.selectedImage =[UIImage imageNamed:@"like_selected"];
    
    VideoViewController * videoVc = [[VideoViewController alloc] init];
    videoVc.tabBarItem.title=@"Video";
    videoVc.tabBarItem.image=[UIImage imageNamed:@"video"];
    videoVc.tabBarItem.selectedImage =[UIImage imageNamed:@"video_selected"];
    
    
    [tabbarController setViewControllers:@[newsVc,recommendVc,videoVc]];
    tabbarController.delegate = self;
    
    self.window.rootViewController = navigationController;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
    
    //测试更换图标
    //[self _changeIcon];
}



- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"application open Url %@ %@",url ,options);
    return  YES;
}

@end
