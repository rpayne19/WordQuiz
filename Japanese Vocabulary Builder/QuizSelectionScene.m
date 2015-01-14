//
//  QuizSelectionScene.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 9/19/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "QuizSelectionScene.h"
#import "TitleScene.h"
#import "ParseWordFile.h"
#import "GameScene.h"

@implementation QuizSelectionScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
//         Later when background image is used:
//        [background setXScale:self.xScale /2.0f];
//        [background setYScale:self.yScale + 0.6];
        quiz1 = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quiz1.text = @"Quiz 1";
        quiz1.fontSize = 32;
        [quiz1 setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (0.8/5.0))];
        [self addChild:quiz1];
        
        quiz2 = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quiz2.text = @"Quiz 2";
        quiz2.fontSize = 32;
        [quiz2 setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (1.5/5.0))];
        [self addChild:quiz2];
        
        quiz3 = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quiz3.text = @"Quiz 3";
        quiz3.fontSize = 32;
        [quiz3 setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (2.2/5.0))];
        [self addChild:quiz3];
        
        quiz4 = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quiz4.text = @"Quiz 4";
        quiz4.fontSize = 32;
        [quiz4 setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (2.9/5.0))];
        [self addChild:quiz4];
        
        quiz5 = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quiz5.text = @"Quiz 5";
        quiz5.fontSize = 32;
        [quiz5 setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (3.6/5.0))];

        [self addChild:quiz5];
        
        quiz6 = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quiz6.text = @"Quiz 6";
        quiz6.fontSize = 32;
        [quiz6 setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (4.3/5.0))];
        [self addChild:quiz6];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if([quiz1 containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            if(wordBank == NULL){
                wordBank = [[NSMutableArray alloc]init];
                [ParseWordFile parseWordFile: wordBank withFileName:@"test"];
            }
            
            GameScene *gameScene = [[GameScene alloc]initWithSize:self.size andWordBank:wordBank andQuizNumber:@"1"];
            
            gameScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: gameScene transition:reveal];
        }
        if([quiz2 containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            if(wordBank == NULL){
                wordBank = [[NSMutableArray alloc]init];
                [ParseWordFile parseWordFile: wordBank withFileName:@"wordbank2"];
            }
            GameScene *gameScene = [[GameScene alloc]initWithSize:viewSize andWordBank:wordBank andQuizNumber:@"2"];
            
            gameScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: gameScene transition:reveal];
        }else
        if([quiz3 containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            if(wordBank == NULL){
                wordBank = [[NSMutableArray alloc]init];
                [ParseWordFile parseWordFile: wordBank withFileName:@"wordbank3"];
            }
            GameScene *gameScene = [[GameScene alloc]initWithSize:viewSize andWordBank:wordBank andQuizNumber:@"3"];
            
            gameScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: gameScene transition:reveal];
        }else
        if([quiz4 containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            if(wordBank == NULL){
                wordBank = [[NSMutableArray alloc]init];
                [ParseWordFile parseWordFile: wordBank withFileName:@"wordbank4"];
            }
            GameScene *gameScene = [[GameScene alloc]initWithSize:viewSize andWordBank:wordBank andQuizNumber:@"4"];
            
            gameScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: gameScene transition:reveal];
        }else
        if([quiz5 containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            if(wordBank == NULL){
                wordBank = [[NSMutableArray alloc]init];
                [ParseWordFile parseWordFile: wordBank withFileName:@"wordbank5"];
            }
            GameScene *gameScene = [[GameScene alloc]initWithSize:viewSize andWordBank:wordBank andQuizNumber:@"5"];
            
            gameScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: gameScene transition:reveal];
        }else
        if([quiz6 containsPoint:location]){
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
            if(wordBank == NULL){
                wordBank = [[NSMutableArray alloc]init];
                [ParseWordFile parseWordFile: wordBank withFileName:@"wordbank6"];
            }
            GameScene *gameScene = [[GameScene alloc]initWithSize:viewSize andWordBank:wordBank andQuizNumber:@"6"];
            
            gameScene.scaleMode = SKSceneScaleModeAspectFill;
            
            [self.scene.view presentScene: gameScene transition:reveal];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
