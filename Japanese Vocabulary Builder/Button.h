//
//  Button.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 1/17/15.
//  Copyright (c) 2015 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Button : SKSpriteNode {
    SKLabelNode *label;
}

-(id)init;
-(void)setButtonLabelTo:(NSString*)text;
-(void)setPositionTo:(CGPoint)aPosition;
-(void)addTo:(SKScene*)aScene;

@end
