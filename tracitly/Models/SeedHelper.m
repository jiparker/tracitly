//
//  ActivityHelper.m
//  tracitly
//
//  Created by JAMES PARKER on 6/17/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "SeedHelper.h"
#import "Activity.h"
#import "DataHelper.h"

@implementation SeedHelper

+ (void)seedCategories {
    
    
    
}

+ (void)seedActivities {
    NSMutableArray *activities = [NSMutableArray arrayWithCapacity:20];
    
    Activity *activity = [[Activity alloc] init];
    
    activity.title = @"Clean Bathrooms";
    activity.category = @"Maint";
    activity.estimate = 1;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Organize Basement";
    activity.category = @"project";
    activity.estimate = 25;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Organize Garage";
    activity.category = @"project";
    activity.estimate = 60;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Weed back yard";
    activity.category = @"Yard";
    activity.estimate = 25;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Prep Chicken";
    activity.category = @"Maint";
    activity.estimate = 10;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Change Sheets";
    activity.category = @"Maint";
    activity.estimate = 20;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Clean Kitchen";
    activity.category = @"Maint";
    activity.estimate = 15;
    [activities addObject:activity];
    activity = [[Activity alloc] init];
    activity.title = @"Mop Floor";
    activity.category = @"Maint";
    activity.estimate = 10;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Vacume";
    activity.category = @"Maint";
    activity.estimate = 25;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Sweep Garage";
    activity.category = @"Maint";
    activity.estimate = 15;
    [activities addObject:activity];
    
    activity = [[Activity alloc] init];
    activity.title = @"Paint Deck";
    activity.category = @"project";
    activity.estimate = 15;
    [activities addObject:activity];
    
    [DataHelper SaveObjects:activities];
    
    }



@end
