//
//  ActivityDetailsViewController.h
//  tracitly
//
//  Created by JAMES PARKER on 6/17/14.
//  Copyright (c) 2014 JP. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ActivityDetailsViewController.h"
#import "Activity.h"
#import "CategoryPickerViewController.h"


@class ActivityDetailsViewController;
@class Activity;

@protocol ActivityDetailsViewControllerDelegate <NSObject>
- (void)activityDetailsViewControllerDidCancel:(ActivityDetailsViewController *)controller;

- (void)activityDetailsViewController: (ActivityDetailsViewController *)controller didAddActivity:(Activity *)activity;
- (void)activityDetailsViewController: (ActivityDetailsViewController *)controller didEditActivity:(Activity *)activity;

@end

@interface ActivityDetailsViewController : UITableViewController
                                            <CategoryPickerViewControllerDelegate>

@property (nonatomic, weak) id <ActivityDetailsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextField *estTextField;
@property (strong, nonatomic) Activity *activityToEdit;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end

