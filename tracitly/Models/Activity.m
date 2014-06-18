//
//  Activity.m
//  tracitly
//
//  Created by JAMES PARKER on 6/16/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "Activity.h"

NSString *const kACTIVITY_title = @"title";
NSString *const kACTIVITY_category = @"category";
NSString *const kACTIVITY_estimate = @"estimate";

@implementation Activity

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_title forKey:kACTIVITY_title];
    [aCoder encodeObject:_category forKey:kACTIVITY_category];
    [aCoder encodeInt:_estimate forKey:kACTIVITY_estimate];
    
    
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    
    if (self) {
        
        [self setTitle:[aDecoder decodeObjectForKey:kACTIVITY_title]];
        [self setCategory:[aDecoder decodeObjectForKey:kACTIVITY_title]];
        [self setEstimate:[aDecoder decodeIntForKey:kACTIVITY_estimate]];
        
    }
    return self;
    
}

@end
