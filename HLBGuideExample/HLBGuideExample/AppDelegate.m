//
//  AppDelegate.m
//  HLBGuideExample
//
//  Created by HuangLibo on 2020/10/5.
//

#import "AppDelegate.h"
#import "MyExampleViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MyExampleViewController *vc = [[MyExampleViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
