//
//  KatakanaScene.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 12/27/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "KatakanaScene.h"
#import "TitleScene.h"

@implementation KatakanaScene

-(instancetype)initWithSize:(CGSize)size {
    if(self = [super initWithSize:size]) {
        backgroundImage = [[SKSpriteNode alloc]initWithImageNamed:@"katakanaReview"];
        [backgroundImage setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];
        backgroundImage.size = self.size;
        [self addChild:backgroundImage];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    TitleScene *titleScene = [[TitleScene alloc]initWithSize:self.size];
    
    titleScene.scaleMode = SKSceneScaleModeAspectFill;
    
    [self.scene.view presentScene: titleScene transition:reveal];
}

@end
