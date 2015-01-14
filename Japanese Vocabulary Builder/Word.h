//
//  Word.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/23/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject{
    NSString *key;
    NSString *english;
    BOOL used;
}
@property(atomic, assign)BOOL used;

-(id)initWithKey:(NSString*)aKey andWord:(NSString*) word;
-(void)setUnused;
-(void)setUsed;
-(NSString*)getKey;
-(NSString*)getValue;
@end
