//
//  AppDelegate.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-24.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewControllerOne.h"
#import "RootViewControllerTwo.h"
#import "RootViewControllerThree.h"
#import "RootViewControllerFour.h"
#import "RootViewControllerFive.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createTabMenu];
    return YES;
}

- (void)createTabMenu {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tb = [[UITabBarController alloc] init];

    
    //b.创建子控制器
    UIViewController *c1=[[RootViewControllerOne alloc] init];
//    c1.view.backgroundColor=[UIColor greenColor];
    
    
    UIViewController *c2=[[RootViewControllerTwo alloc]init];
    c2.view.backgroundColor=[UIColor brownColor];
    
    
    UIViewController *c3=[[RootViewControllerThree alloc]init];
    
    UIViewController *c4=[[RootViewControllerFour alloc]init];
    
    UIViewController *c5=[[RootViewControllerFive alloc]init];
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
    [nav1 setNavigationBarHidden:YES animated:NO];
    nav1.tabBarItem.title=@"消息";
    nav1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
    nav1.tabBarItem.badgeValue=@"123";

    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:c2];
    [nav2 setNavigationBarHidden:YES animated:NO];
    nav2.tabBarItem.title=@"联系人";
    nav2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
    
    
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:c3];
    [nav3 setNavigationBarHidden:YES animated:NO];
    nav3.tabBarItem.title=@"动态";
    nav3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];


    
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:c4];
    [nav4 setNavigationBarHidden:YES animated:NO];
    nav4.tabBarItem.title=@"会员中心";
    nav4.tabBarItem.image=[UIImage imageNamed:@"tab_me_nor"];


    
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:c5];
    [nav5 setNavigationBarHidden:YES animated:NO];
    nav5.tabBarItem.title=@"设置";
    nav5.tabBarItem.image=[UIImage imageNamed:@"tab_me_nor"];

    
    
    
    //c.添加子控制器到ITabBarController中
    //c.1第一种方式
    //    [tb addChildViewController:c1];
    //    [tb addChildViewController:c2];
    
    //c.2第二种方式
//    tb.viewControllers=@[c1,c2,c3,c4,c5];
    tb.viewControllers =@[nav1,nav2,nav3,nav4,nav5,];
    self.window.rootViewController = tb;

    //2.设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
