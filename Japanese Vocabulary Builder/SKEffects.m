//
//  SKFadingEffect.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 12/1/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "SKEffects.h"

@implementation SKEffects
+(void)fadingEffectWithNode:(SKNode*)anSKNode withDuration:(NSTimeInterval)time {
    if(!anSKNode.hasActions){
        
        if(anSKNode.alpha < 0.01f) {
            SKAction *fadeIn = [SKAction fadeInWithDuration:time];
            [anSKNode runAction:fadeIn];
        }else if(anSKNode.alpha > 0.99f){
            SKAction *fadeOut = [SKAction fadeOutWithDuration:time];
            [anSKNode runAction:fadeOut];
        }
    }
}

+(void)loopingScrollLeftToRight:(SKNode*)anSKNode {
    if(!anSKNode.hasActions) {
        CGFloat speed = rand() % 30;
        CGFloat size = (50.0f - speed) / 50.0f;
        [anSKNode setScale:size];
        SKAction *moveLeft = [SKAction moveTo:CGPointMake((1600 + rand() % 300), anSKNode.position.y) duration:20.0 + speed];
        [anSKNode setPosition:CGPointMake(-(600 + rand() % 600), anSKNode.position.y)];
        [anSKNode runAction:moveLeft];
    }
}

+(void)loopingScrollRightToLeft:(SKNode*)anSKNode {
    if(!anSKNode.hasActions) {
        SKAction *moveRight = [SKAction moveTo:CGPointMake(-(600 + rand() % 300), anSKNode.position.y) duration:15.0 + rand() % 10];
        [anSKNode setPosition:CGPointMake((600 + rand() % 300), anSKNode.position.y)];
        [anSKNode runAction:moveRight];
    }
}

+(void)counterClockwiseZRotation:(SKNode*)anSKNode {
    anSKNode.zRotation += .325;
}

+(void)clockwiseZRotation:(SKNode*)anSKNode {
    anSKNode.zRotation -= .325;
}

+(void)scaleSKNode:(SKNode*)anSKNode To:(CGFloat)aScale {
    if(anSKNode.yScale > aScale) {
        anSKNode.yScale -= .2;
    } else if(anSKNode.yScale < aScale) {
        anSKNode.yScale += .2;
    }
    
    if(anSKNode.xScale > aScale) { 
        anSKNode.xScale -= .2;
    } else if(anSKNode.xScale < aScale) {
        anSKNode.xScale += .2;
    }
}

+(void)fall:(SKNode*)anSKNode {
    if(anSKNode.position.y > -500) {
        anSKNode.position = CGPointMake(anSKNode.position.x, anSKNode.position.y - 5);
    }
}

@end
