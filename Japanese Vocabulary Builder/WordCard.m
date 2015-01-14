//
//  WordCard.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/23/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "WordCard.h"
#import "SKEffects.h"

@implementation WordCard

@synthesize wordLabel;
@synthesize sprite;
@synthesize state;

-(id)init{
    sprite = [[SKSpriteNode alloc]initWithImageNamed:@"buttonWood"];
    wordLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
    wordLabel.fontSize = 30;
    isFinished = NO;
    isNew = YES;
    state = 0;

    return self;
}

-(void)setLabelTo:(NSString*)label{
    word = label;
    wordLabel.text = label;
    [sprite setSize:CGSizeMake([label length] * 30 + 10, 40)];
    if([label length] < 8){
        finalSizeWidth = [label length] * 40 + 20;
    }
    else if([label length] < 17){
        finalSizeWidth = [label length] * 32 + 12;
    }
    else{
        finalSizeWidth = ([label length] - 12) * 32 + 12;
    }
    finalSizeHeight = 120;
    [self resetPositionAndSize];
}

-(void)setPositionTo:(CGPoint)aPosition{
    finalPositionX = aPosition.x;
    finalPositionY = aPosition.y;
    sprite.position = CGPointMake(aPosition.x, aPosition.y + 10);
    wordLabel.position = aPosition;
    [self resetPositionAndSize];
}

-(void)addTo:(SKScene*)aScene{
    [aScene addChild:sprite];
    [aScene addChild:wordLabel];
}

-(BOOL)containsPoint:(CGPoint)aPoint{
    return [sprite containsPoint:aPoint];
}

-(void)resetPositionAndSize{
    [sprite setSize:CGSizeMake(1, 1)];
    wordLabel.fontSize = 1;
    [sprite setPosition:CGPointMake(-50, sprite.position.y)];
    [wordLabel setPosition:CGPointMake(-50, wordLabel.position.y)];
    isNew = YES;
    isFinished = NO;
    state = 0;
}

-(void)updateSizeAndPositionOnNew{
    if(sprite.size.height < finalSizeHeight){
        [sprite setSize:CGSizeMake(sprite.size.width + 2, sprite.size.height + 2)];
    }
    if(sprite.size.width < finalSizeWidth){
        [sprite setSize:CGSizeMake(sprite.size.width + [word length] /1.5, sprite.size.height)];
    }
    if(sprite.position.x < finalPositionX){
        [sprite setPosition:CGPointMake(sprite.position.x + 10, sprite.position.y)];
        [wordLabel setPosition:CGPointMake(wordLabel.position.x + 10, wordLabel.position.y)];
        [SKEffects clockwiseZRotation:wordLabel];
        [SKEffects counterClockwiseZRotation:sprite];
    }else{
        isNew = NO;
        state = 1;
        sprite.zRotation = 0.0;
        wordLabel.zRotation = 0.0;
    }
    if([word length] < 17){
        if(wordLabel.fontSize < 30){
            wordLabel.fontSize = wordLabel.fontSize + .75;
        }
        else{
            wordLabel.fontSize = 30;
        }
    }else{
        if(wordLabel.fontSize < 22){
            wordLabel.fontSize = wordLabel.fontSize + .37;
        }
        else{
            wordLabel.fontSize = 26;
        }
    }
}

-(void)updateSizeAndPositionOnFinish{

    if(sprite.position.x < finalPositionX * 3.5){
        [sprite setPosition:CGPointMake(sprite.position.x + 15, sprite.position.y)];
        [wordLabel setPosition:CGPointMake(wordLabel.position.x + 15, wordLabel.position.y)];
        [SKEffects clockwiseZRotation:sprite];
        [SKEffects clockwiseZRotation:wordLabel];
        [SKEffects scaleSKNode:sprite To:3.0];
        [SKEffects scaleSKNode:wordLabel To:3.0];
    }else{
        isFinished = YES;
        state = 0;
        sprite.zRotation = 0.0;
        wordLabel.zRotation = 0.0;
        sprite.xScale = 1.0;
        sprite.yScale = 1.0;
        wordLabel.yScale = 1.0;
        wordLabel.xScale = 1.0;
    }
}

-(BOOL)isDoneMovingOnNew{
    return !isNew;
}
-(BOOL)isDoneMovingOnFinished{
    return isFinished;
}
-(void)setFinished{
    isFinished = NO;
    state = 2;
}
@end
