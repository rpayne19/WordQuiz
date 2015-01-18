//
//  Button.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 1/17/15.
//  Copyright (c) 2015 Robert Payne. All rights reserved.
//

#import "Button.h"

@implementation Button

-(id)init{
    self = [super initWithImageNamed:@"buttonWood"];
    label = [SKLabelNode new];
    label = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
    label.fontSize = 30;
    
    return self;
}

-(void)setButtonLabelTo:(NSString*)text{
    
    [label setText:text];
    if([label.text length] < 8){
        self.size = CGSizeMake([label.text length] * 40 + 20, 120);
    }
    else if([label.text length] < 17){
        self.size = CGSizeMake([label.text length] * 32 + 12, 120);
    }
    else{
        self.size = CGSizeMake(([label.text length] - 12) * 32 + 12, 120);
    }
}

-(void)setPositionTo:(CGPoint)aPosition {
    self.position = CGPointMake(aPosition.x, aPosition.y + 10);
    label.position = aPosition;
}

-(void)addTo:(SKScene*)aScene{
    [aScene addChild:self];
    [aScene addChild:label];

}

-(void)runAction:(SKAction *)action {
    [super runAction:action];
    [label runAction:action];
}

@end
