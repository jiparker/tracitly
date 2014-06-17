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
@property (nonatomic,assign) int startTime;
@property (nonatomic, assign) int endTime;
@end
