//
//  Event.h
//  tracitly
//
//  Created by JAMES PARKER on 6/16/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (nonatomic,copy) NSString *activity;
@property (nonatomic,assign) double startTime;
@property (nonatomic, assign) double endTime;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, assign) int estimate;
@end
