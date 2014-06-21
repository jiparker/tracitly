//
//  Event.m
//  tracitly
//
//  Created by JAMES PARKER on 6/16/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "Event.h"

@implementation Event
NSString *const kACTIVITY_activity = @"activity";
NSString *const kACTIVITY_acategory = @"category";
NSString *const kACTIVITY_startTime= @"startTime";
NSString *const kACTIVITY_endTime = @"endTime";


-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_activity forKey:kACTIVITY_activity];
    [aCoder encodeObject:_category forKey:kACTIVITY_acategory];
    [aCoder encodeDouble:_startTime forKey:kACTIVITY_startTime];
    [aCoder encodeDouble:_endTime forKey:kACTIVITY_endTime];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        [self setActivity:[aDecoder decodeObjectForKey:kACTIVITY_activity]];
        [self setCategory:[aDecoder decodeObjectForKey:kACTIVITY_acategory]];
        [self setStartTime:[aDecoder decodeDoubleForKey:kACTIVITY_startTime]];
        [self setEndTime:[aDecoder decodeDoubleForKey:kACTIVITY_endTime]];
    }
    return self;
}

@end
