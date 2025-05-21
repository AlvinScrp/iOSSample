//
//  AppDelegate.m
//  test7
//
//  Created by canglong on 2025/5/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
       self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    UIViewController *vc = [[UIViewController alloc] init];
       self.window.rootViewController = vc;
       [self.window makeKeyAndVisible];
    return YES;
}

@end
