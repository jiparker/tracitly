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
    NSURL *dataFile = [FileSystemHelper nsurlForDocumentsFile:[className stringByAppendingString:@".data"]];
    NSString *filePath = [dataFile path];
    BOOL success = [NSKeyedArchiver archiveRootObject:objects toFile:filePath];
    return success;
}

+(NSMutableArray *)loadObjectsWithModelName:(NSString *)name {
    NSURL *dataFile = [FileSystemHelper nsurlForDocumentsFile:[name stringByAppendingString:@".data"]];
    //NSURL *dataFile = [FileSystemHelper pathForDocumentsFile:@"Event.data"];
    NSString *filePath = [dataFile path];
    NSMutableArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (objects == nil) return [[NSMutableArray alloc] init];
    return objects;
}

+(NSObject *)getLastObject:(NSString *)name {
    
    NSMutableArray *array = [self loadObjectsWithModelName:name];
    
    if (array.count > 0) {
        NSObject *object =  array[array.count -1];
        return object;
    }
    else return nil;
    
}

+(NSObject *)createObject:(NSObject *)object {
    NSString *className = NSStringFromClass([object class]);
    NSMutableArray *array = [self loadObjectsWithModelName:className];
    
    [array addObject:object];
    if ([self SaveObjects:array])
    {
        return (NSObject *)array[array.count -1];
        
    }
    else return nil;
    
}

+(BOOL)updateLatestObject:(NSObject *)object {
    
    NSString *className = NSStringFromClass([object class]);
    NSMutableArray *array = [self loadObjectsWithModelName:className];
    
    array[array.count -1] = object;
    if ([self SaveObjects:array]) return YES;
    else return NO;
    
}

@end
