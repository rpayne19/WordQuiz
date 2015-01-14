//
//  Word.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/23/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "Word.h"

@implementation Word
@synthesize used;

-(id)initWithKey:(NSString*)aKey andWord:(NSString*) word{
    key = aKey;
    english = word;
    used = NO;
    return self;
}
-(void)setUsed{
    used = YES;
}
-(void)setUnused{
    used = NO;
}

-(NSString*)getKey{
    return key;
}
-(NSString*)getValue{
    return english;
}

@end
