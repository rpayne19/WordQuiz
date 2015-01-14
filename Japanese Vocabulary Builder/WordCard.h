//
//  WordCard.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/23/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface WordCard : NSObject{
    SKSpriteNode        *sprite;
    SKLabelNode         *wordLabel;
    NSString            *word;
    int                 finalSizeWidth;
    int                 finalSizeHeight;
    int                 finalPositionX;
    int                 finalPositionY;
    int                 statePosition;
    BOOL                isNew;
    BOOL                isFinished;
    uint                state;

}

@property (nonatomic, retain)SKLabelNode* wordLabel;
@property (nonatomic, retain)SKSpriteNode* sprite;
@property (atomic, assign)uint state;

-(id)init;
-(void)setLabelTo:(NSString*)label;
-(void)setPositionTo:(CGPoint)aPosition;
-(void)addTo:(SKScene*)aScene;
-(BOOL)containsPoint:(CGPoint)aPoint;
-(void)resetPositionAndSize;
-(void)updateSizeAndPositionOnNew;
-(void)updateSizeAndPositionOnFinish;
-(BOOL)isDoneMovingOnNew;
-(BOOL)isDoneMovingOnFinished;
-(void)setFinished;
@end
