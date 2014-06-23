//
//  ActivityTableViewController.h
//  tracitly
//
//  Created by JAMES PARKER on 6/16/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityDetailsViewController.h"
#import "SettingViewController.h"

@interface ActivityTableViewController : UITableViewController
                                            <ActivityDetailsViewControllerDelegate>
                                           

@property (nonatomic, strong) NSMutableArray *activities;

@end
