//
//  HistoryCell.h
//  tracitly
//
//  Created by JAMES PARKER on 6/22/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *lblActivity;
@property (nonatomic,weak) IBOutlet UILabel *lblCategory;
@property (nonatomic,weak) IBOutlet UILabel *lblDate;
@property (nonatomic,weak) IBOutlet UILabel *lblStartTime;
@property (nonatomic,weak) IBOutlet UILabel *lblDuration;
@property (nonatomic,weak) IBOutlet UILabel *lblEstimate;
@property (nonatomic,weak) IBOutlet UILabel *lblPercent;


@end
