//
//  DataHelper.m
//  tracitly
//
//  Created by JAMES PARKER on 6/18/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "DataHelper.h"
#import "FileSystemHelper.h"

#import "Activity.h"
#import "TaskCategory.h"
#import "Event.h"



@implementation DataHelper

+(BOOL)SaveObjects:(NSMutableArray *)objects {
    NSString *className = NSStringFromClass([objects[0] class]);
    NSURL *dataFile = [FileSystemHelper pathForDocumentsFile:[className stringByAppendingString:@".data"]];
    NSString *filePath = [dataFile path];
    BOOL success = [NSKeyedArchiver archiveRootObject:objects toFile:filePath];
    return success;
}

+(NSMutableArray *)loadObjectsWithModelName:(NSString *)name {
    NSURL *dataFile = [FileSystemHelper pathForDocumentsFile:[name stringByAppendingString:@".data"]];
    NSString *filePath = [dataFile path];
    NSMutableArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return objects;
}
@end
