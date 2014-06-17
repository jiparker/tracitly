//
//  ActivityCell.h
//  tracitly
//
//  Created by JAMES PARKER on 6/16/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *titleLabel;
@property (nonatomic,weak) IBOutlet UILabel *catLabel;
@property (nonatomic,weak) IBOutlet UILabel *estLabel;

@end
