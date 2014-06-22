//
//  MainViewController.h
//  tracitly
//
//  Created by JAMES PARKER on 6/17/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *lblElapsed;
@property (weak, nonatomic) IBOutlet UILabel *lblTest;
@property (nonatomic, strong) NSMutableArray *activities;
@property (weak, nonatomic) IBOutlet UILabel *lblEstimate;
@property (weak, nonatomic) IBOutlet UITableView *tvMain;
@property (weak, nonatomic) IBOutlet UILabel *lblPercentDone;
@end
