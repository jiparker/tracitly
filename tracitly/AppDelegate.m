//
//  AppDelegate.m
//  tracitly
//
//  Created by JAMES PARKER on 6/5/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "AppDelegate.h"
#import "ActivityTableViewController.h"
#import "Activity.h"
#import "SeedHelper.h"
#import "MainViewController.h"
#import "DataHelper.h"

@implementation AppDelegate
{
    NSMutableArray *_activities;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Seed data after refresh of app settings for testing helps
    //[SeedHelper seedActivities];
    //[SeedHelper seedCategories];
    _activities = [DataHelper loadObjectsWithModelName:@"Activity"];
    
   
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    UINavigationController *navigationController = [tabBarController viewControllers][1];
    ActivityTableViewController *activitiesViewController = [navigationController viewControllers][0];
    activitiesViewController.activities = _activities;
    
    MainViewController *main = [tabBarController viewControllers][0];
    main.activities = _activities;
    
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
