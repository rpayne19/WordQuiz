//
//  ParseWordFile.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/20/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParseWordFile : NSObject

+ (void)parseWordFile:(NSMutableArray*)input withFileName:(NSString*)fileName;

@end
