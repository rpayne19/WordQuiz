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
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        quizNum = aQuizNumber;
        quizLabel = [SKLabelNode new];
        scoreLabel = [SKLabelNode new];
        numOfWordsInQuizLabel = [SKLabelNode new];
        retryLabel = [SKLabelNode new];
        
        quizLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        quizLabel.fontSize = 36;
        quizLabel.position = CGPointMake(CGRectGetMidX(self.frame)/1.5,
                                         self.frame.size.height - (self.frame.size.height * 0.2));
        
        scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        scoreLabel.fontSize = 36;
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame)/1.5,
                                          self.frame.size.height - (self.frame.size.height * 0.4));
        
        numOfWordsInQuizLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        numOfWordsInQuizLabel.fontSize = 36;
        numOfWordsInQuizLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                                     self.frame.size.height - (self.frame.size.height * 0.6));
        
        retryLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        retryLabel.fontSize = 36;
        retryLabel.position = CGPointMake(CGRectGetMidX(self.frame)/1.5,
                                self.frame.size.height - (self.frame.size.height * 0.8));
        
        yesButton = [[WordCard alloc]init];
        [yesButton setPositionTo:CGPointMake(CGRectGetMidX(self.frame)/1.5 + 120,
         self.frame.size.height - (self.frame.size.height * 0.8))];
        [yesButton addTo:self];
        [yesButton setLabelTo:@"Yes"];
        
        yesLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        yesLabel.fontSize = 36;
        yesLabel.position = CGPointMake(CGRectGetMidX(self.frame)/1.5 + 120,
                                        self.frame.size.height - (self.frame.size.height * 0.8));
        
        noLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        noLabel.fontSize = 36;
        noLabel.position = CGPointMake(CGRectGetMidX(self.frame)/1.5 + 200,
                                        self.frame.size.height - (self.frame.size.height * 0.8));
        wordBank = quizWords;
        
        [quizLabel setText:[NSString stringWithFormat:@"Quiz: %@", quizNum]];
        [scoreLabel setText:[NSString stringWithFormat:@"Score: %@%%",[NSNumber numberWithFloat:score]]];
        [numOfWordsInQuizLabel setText:[NSString stringWithFormat:@"Number of Words: %i", [quizWords count]]];
        [retryLabel setText:@"Retry ?"];
        [yesLabel setText:@"Yes"];
        [noLabel setText:@"No"];
    
        [self addChild:quizLabel];
        [self addChild:retryLabel];
        [self addChild:numOfWordsInQuizLabel];
        [self addChild:scoreLabel];
        [self addChild:yesLabel];
        [self addChild:noLabel];
    
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
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1.0];
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
        if([yesLabel containsPoint:location]) {
            [self transitionBackToQuiz];
        } else if([noLabel containsPoint:location]) {
            [self transitionToTitle];
        }
    }
}

-(void)update:(NSTimeInterval)currentTime {
    [SKEffects fadingEffectWithNode:retryLabel withDuration:1.3f];

}

@end
