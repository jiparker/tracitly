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
#import "FileSystemHelper.h"

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

    if ([DataHelper SaveObjects:activities]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Done:" message:@"Test data seeded. (and, ah, please restart the app)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error:" message:@"whoops" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

+ (void)clearActivities {
    
     NSURL *dataFile = [FileSystemHelper nsurlForDocumentsFile:@"Activity.data"];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSError *error;
    BOOL success = [fileManager removeItemAtURL:dataFile error:&error];
    if (success) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Done:" message:@"Data removed.  (and, ah, please restart the app)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }

}





@end
