//
//  CategoryPickerViewController.h
//  tracitly
//
//  Created by JAMES PARKER on 6/17/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CategoryPickerViewController;

@protocol CategoryPickerViewControllerDelegate <NSObject>
- (void)categoryPickerViewController:(CategoryPickerViewController *)controller didSelectCategory:(NSString *)category;
@end

@interface CategoryPickerViewController : UITableViewController

@property (nonatomic, weak) id <CategoryPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *category;

@end
