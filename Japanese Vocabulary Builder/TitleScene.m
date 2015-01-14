//
//  MyScene.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/17/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "TitleScene.h"
#import "ParseWordFile.h"
#import "GameScene.h"
#import "QuizSelectionScene.h"
#import "HiraganaScene.h"
#import "KatakanaScene.h"
#import "SKEffects.h"

@implementation TitleScene

-(id)initWithSize:(CGSize)size {
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);

    if (self = [super initWithSize:screenSize]) {
        /* Setup your scene here */
        isFadingOut = YES;
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
                
        backgroundImage = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackground"];
        [backgroundImage setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];
 //       [backgroundImage setXScale:self.xScale];
 //       [backgroundImage setYScale:self.yScale];
        [self addChild:backgroundImage];
        
        menuLabel = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackgroundTitle"];
        [menuLabel setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];
//        [menuLabel setXScale:self.xScale / 2.0];
//        [menuLabel setYScale:self.yScale / 2.0];
        [self addChild:menuLabel];
        
        kaomojiMan = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackgroundFace"];
        [kaomojiMan setPosition:CGPointMake(self.size.width/2.0,(self.size.height/2.0) - 300)];
//        [kaomojiMan setXScale:self.xScale / 2.0];
//        [kaomojiMan setYScale:self.yScale / 2.0];
        [self addChild:kaomojiMan];
        SKAction *moveUp = [SKAction moveToY:self.size.height/1.7 duration:3.0];
        [kaomojiMan runAction:moveUp];
        
        cloudOne = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackgroundCloud"];
        [cloudOne setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];
//        [cloudOne setXScale:self.xScale / 2.0];
//        [cloudOne setYScale:self.yScale / 2.0];
        [self addChild:cloudOne];
        
        cloudTwo = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackgroundCloud"];
        [cloudTwo setPosition:CGPointMake(self.size.width/2.0,(self.size.height/2.0) + 45)];
//        [cloudTwo setXScale:self.xScale / 1.9];
//        [cloudTwo setYScale:self.yScale / 1.85];
        [self addChild:cloudTwo];
        
        cloudThree = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackgroundCloud"];
        [cloudThree setPosition:CGPointMake(self.size.width/2.0,(self.size.height/2.0) - 60)];
//        [cloudThree setXScale:self.xScale / 2.2];
//        [cloudThree setYScale:self.yScale / 2.5];
        [self addChild:cloudThree];
        
        japaneseText = [[SKSpriteNode alloc]initWithImageNamed:@"titleBackgroundJapanese"];
        [japaneseText setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0-200)];
//        [japaneseText setXScale:self.xScale / 2.0];
//        [japaneseText setYScale:self.yScale / 2.0];
        [japaneseText setAlpha:0.0f];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [japaneseText runAction:[SKAction fadeAlphaTo:1.0f duration:1.2f]];
        });
        [self addChild:japaneseText];
        
        
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        myLabel.text = @"Quiz Mode";
        myLabel.fontSize = 52;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMaxY(self.frame) * (3.0/5.0));
        [self addChild:myLabel];
        
        hiraganaLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        hiraganaLabel.text = @"Hiragana Review";
        hiraganaLabel.fontSize = 52;
        hiraganaLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMaxY(self.frame) * (2.2/5.0));
        [self addChild:hiraganaLabel];
        
        katakanaLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        katakanaLabel.text = @"Katakana Review";
        katakanaLabel.fontSize = 52;
        katakanaLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMaxY(self.frame) * (1.4/5.0));
        [self addChild:katakanaLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if([myLabel containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            QuizSelectionScene *selectionScene = [[QuizSelectionScene alloc]initWithSize:self.size];

            selectionScene.scaleMode = SKSceneScaleModeAspectFill;
        
            [self.scene.view presentScene: selectionScene transition:reveal];
            
        } else if([hiraganaLabel containsPoint:location]) {
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            HiraganaScene *hiraganaScene = [[HiraganaScene alloc]initWithSize:self.size];
            
            hiraganaScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: hiraganaScene transition:reveal];
            
        } else if([katakanaLabel containsPoint:location]) {
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            KatakanaScene *katakanaScene = [[KatakanaScene alloc]initWithSize:self.size];
            
            katakanaScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: katakanaScene transition:reveal];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [SKEffects fadingEffectWithNode:menuLabel withDuration:1.3f];
    [SKEffects loopingScrollLeftToRight:cloudOne];
    [SKEffects loopingScrollLeftToRight:cloudTwo];
    [SKEffects loopingScrollLeftToRight:cloudThree];

    
    
}

@end
