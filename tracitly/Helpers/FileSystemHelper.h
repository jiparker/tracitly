//
//  FileSystemHelper.h
//  tracitly
//
//  Created by JAMES PARKER on 6/18/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileSystemHelper : NSObject
+(NSURL *)pathForDocumentsFile:(NSString *)filename;
@end
