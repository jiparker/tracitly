//
//  FileSystemHelper.m
//  tracitly
//
//  Created by JAMES PARKER on 6/18/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "FileSystemHelper.h"

@implementation FileSystemHelper


+(NSURL *)nsurlForDocumentsFile:(NSString *)filename {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *directories = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentPath = [directories objectAtIndex:0]; //because in iOS, there is only one document directory (per sandboxed app)
    
    return [documentPath URLByAppendingPathComponent:filename];
}

+(NSString *)pathForDocumentsFile:(NSString *)filename {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *directories = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSString *filePath = [directories objectAtIndex:0];
    //NSURL *documentPath = [directories objectAtIndex:0]; //because in iOS, there is only one document directory (per sandboxed app)
    
    return [filePath stringByAppendingString:[NSString stringWithFormat:@"/%@",filename]];
}
@end
