//
//  QuizResultsScreen.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 11/9/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "QuizResultsScreen.h"
#import "TitleScene.h"
#import "GameScene.h"
#import "SKEffects.h"
#import "WordCard.h"

@implementation QuizResultsScreen
-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}
-(id)initWithSize:(CGSize) size andScore:(CGFloat)score andQuizNumber:(NSString*)aQuizNumber andWordsInQuiz:(NSMutableArray*)quizWords{
    if (self = [super initWithSize:size]) {
        
        SKNode *background = [[SKSpriteNode alloc]initWithImageNamed:@"backgroundWood"];
        [background setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];
        
        [self addChild:background];
        
        quizNum = aQuizNumber;
        quizLabel = [SKLabelNode new];
        scoreLabel = [SKLabelNode new];
        numOfWordsInQuizLabel = [SKLabelNode new];
        retryLabel = [SKLabelNode new];
        
        quizLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quizLabel.fontSize = 36;
        quizLabel.position = CGPointMake(CGRectGetMaxX(self.frame)/2,
                                         self.frame.size.height - (self.frame.size.height * 0.2));
        
        scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        scoreLabel.fontSize = 36;
        scoreLabel.position = CGPointMake(CGRectGetMaxX(self.frame)/2,
                                          self.frame.size.height - (self.frame.size.height * 0.4));
        
        numOfWordsInQuizLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        numOfWordsInQuizLabel.fontSize = 36;
        numOfWordsInQuizLabel.position = CGPointMake(CGRectGetMaxX(self.frame)/2,
                                                     self.frame.size.height - (self.frame.size.height * 0.6));
        
        retryLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        retryLabel.fontSize = 36;
        retryLabel.position = CGPointMake(CGRectGetMidX(self.frame)/2,
                                self.frame.size.height - (self.frame.size.height * 0.8));
        
        yesButton = [Button new];
        [yesButton setButtonLabelTo:@"Yes"];
        [yesButton setPositionTo:CGPointMake(CGRectGetMidX(self.frame)/1.5 + 150,
         self.frame.size.height - (self.frame.size.height * 0.8))];
        [yesButton addTo:self];
 
        noButton = [Button new];
        [noButton setButtonLabelTo:@"No"];
        [noButton setPositionTo: CGPointMake(CGRectGetMidX(self.frame)/1.5 + 280,
                                             self.frame.size.height - (self.frame.size.height * 0.8))];
        [noButton addTo:self];
        
        wordBank = quizWords;
        
        [quizLabel setText:[NSString stringWithFormat:@"Quiz: %@", quizNum]];
        [scoreLabel setText:[NSString stringWithFormat:@"Score: %@%%",[NSNumber numberWithFloat:score]]];
        [numOfWordsInQuizLabel setText:[NSString stringWithFormat:@"Number of Words: %i", [quizWords count]]];
        [retryLabel setText:@"Retry ?"];
  
        [quizLabel setFontColor:[UIColor blackColor]];
        [scoreLabel setFontColor:[UIColor blackColor]];
        [numOfWordsInQuizLabel setFontColor:[UIColor blackColor]];
        [retryLabel setFontColor:[UIColor whiteColor]];
        
        [quizLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [scoreLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [numOfWordsInQuizLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        
        [self addChild:quizLabel];
        [self addChild:retryLabel];
        [self addChild:numOfWordsInQuizLabel];
        [self addChild:scoreLabel];
    
    }
    return self;
}

-(void)transitionToTitle {
    
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    TitleScene *title = [[TitleScene alloc] initWithSize:self.size];
    title.scaleMode = SKSceneScaleModeAspectFill;
    [self.scene.view presentScene: title transition:reveal];
}

-(void)transitionBackToQuiz {
    SKTransition *reveal = [SKTransition flipVerticalWithDuration:1.0];
    GameScene *gameScene = [[GameScene alloc]
                            initWithSize:self.size
                            andWordBank:wordBank
                            andQuizNumber:quizNum];
    gameScene.scaleMode = SKSceneScaleModeAspectFill;
    [self.scene.view presentScene:gameScene transition:reveal];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if([yesButton containsPoint:location]) {
            [self transitionBackToQuiz];
        } else if([noButton containsPoint:location]) {
            [self transitionToTitle];
        }
    }
}

-(void)update:(NSTimeInterval)currentTime {
    [SKEffects fadingEffectWithNode:retryLabel withDuration:1.3f];

}

@end
