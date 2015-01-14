//
//  SKFadingEffect.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 12/1/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKEffects : SKAction
+(void)fadingEffectWithNode:(SKLabelNode*)anSKNode withDuration:(NSTimeInterval)time;
+(void)loopingScrollLeftToRight:(SKNode*)anSKNode;
+(void)loopingScrollRightToLeft:(SKNode*)anSKNode;
+(void)counterClockwiseZRotation:(SKNode*)anSKNode;
+(void)clockwiseZRotation:(SKNode*)anSKNode;
+(void)scaleSKNode:(SKNode*)anSKNode To:(CGFloat)aScale;
+(void)fall:(SKNode*)anSKNode;

@end
