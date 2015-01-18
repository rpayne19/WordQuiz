//
//  GameScene.m
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/23/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import "GameScene.h"
#import "TitleScene.h"
#import "Word.h"
#import "WordCard.h"
#import "QuizResultsScreen.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size andWordBank:(NSMutableArray*) words andQuizNumber:(NSString*)quizNo{
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    CGFloat screenScale = [[UIScreen mainScreen] scale];

    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);

    if (self = [super initWithSize:screenSize]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.8 green:0.5 blue:0.5 alpha:1.0];
        SKNode *background = [[SKSpriteNode alloc]initWithImageNamed:@"backgroundWood"];
        [background setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];

        [self addChild:background];
        
        SKNode *seperator = [[SKSpriteNode alloc]initWithImageNamed:@"seperatorWood"];
        [seperator setPosition:CGPointMake(self.size.width/2.0,self.size.height/2.0)];
//        [seperator setXScale:self.xScale];
//        [seperator setYScale:self.yScale];
        seperator.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (0.98/5.0));
        [self addChild:seperator];
        
        wordBank = words;
        numOfWordsUsed = 0;
        correctCard = 0;
        correctCounter = 0;
        wrongCounter = 0;
        quizNumber = quizNo;
        
        keyCard = [[WordCard alloc]init];
        choice1 = [[WordCard alloc]init];
        choice2 = [[WordCard alloc]init];
        choice3 = [[WordCard alloc]init];
        choice4 = [[WordCard alloc]init];
        
        choice1Pos = CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (1.5/5.0));
        choice2Pos =  CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (2.3/5.0));
        choice3Pos =  CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (3.1/5.0));
        choice4Pos =  CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (3.9/5.0));

        [self clearWordsUsed];
        [self getNewWord:keyCard];
        
        [keyCard setPositionTo: CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame) * (0.68/5.0))];
        [keyCard addTo:self];
        
    
        
        [choice1 setPositionTo: choice1Pos];
        [choice1 addTo:self];
        
        [choice2 setPositionTo: choice2Pos];
        [choice2 addTo:self];
        
        [choice3 setPositionTo: choice3Pos];
        [choice3 addTo:self];
        
        [choice4 setPositionTo:choice4Pos];
        [choice4 addTo:self];

        NSLog(@"Word Bank Size: %i", [wordBank count]);
        correctCounterLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        correctCounterLabel.text = [NSString stringWithFormat:@"Correct: %i", correctCounter];
        correctCounterLabel.fontSize = 12;
        correctCounterLabel.position = CGPointMake(CGRectGetMidX(self.frame)/4.0,
                                       0);
        
        wrongCounterLabel = [SKLabelNode labelNodeWithFontNamed:@"Menlo"];
        wrongCounterLabel.text = [NSString stringWithFormat:@"Wrong: %i", correctCounter];
        wrongCounterLabel.fontSize = 12;
        wrongCounterLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                                   0);
        
        [self addChild:correctCounterLabel];
        [self addChild:wrongCounterLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
        if([self isDoneUpdatingCards]) {
        
            for (UITouch *touch in touches) {
            CGPoint location = [touch locationInNode:self];
            if([keyCard containsPoint:location]){
                NSLog(@"Keycard touched");

            }
        
            switch(correctCard){
                case 1:
                    if([choice1 containsPoint:location]){
                        NSLog(@"Correct choice made");
                        [choice1 setFinished];
                        [self dropTheOtherWordCards:choice1];
                        [self incrementWordCount];
                        correctCounter ++;
                        correctCounterLabel.text = [NSString stringWithFormat:@"Correct: %i", correctCounter];

                    }else {
                        if([choice2 containsPoint:location]){
                            [self wrongChoice:choice2];
                        }else if ([choice3 containsPoint:location]){
                            [self wrongChoice:choice3];
                        }else if([choice4 containsPoint:location]){
                            [self wrongChoice:choice4];
                        }
                    }
                    break;
                case 2:
                    if([choice2 containsPoint:location]){
                        NSLog(@"Correct choice made");
                        [choice2 setFinished];
                        [self dropTheOtherWordCards:choice2];
                        [self incrementWordCount];
                        correctCounter ++;
                        correctCounterLabel.text = [NSString stringWithFormat:@"Correct: %i", correctCounter];

                    }else {
                        if([choice1 containsPoint:location]){
                            [self wrongChoice:choice1];
                        }else if ([choice3 containsPoint:location]){
                            [self wrongChoice:choice3];
                        }else if([choice4 containsPoint:location]){
                            [self wrongChoice:choice4];
                        }
                    }

                    break;
                case 3:
                    if([choice3 containsPoint:location]){
                        NSLog(@"Correct choice made");
                        [choice3 setFinished];
                        [self dropTheOtherWordCards:choice3];
                        [self incrementWordCount];
                        correctCounter ++;
                        correctCounterLabel.text = [NSString stringWithFormat:@"Correct: %i", correctCounter];

                    }else {
                        if([choice1 containsPoint:location]){
                            [self wrongChoice:choice1];
                        }else if ([choice2 containsPoint:location]){
                            [self wrongChoice:choice2];
                        }else if([choice4 containsPoint:location]){
                            [self wrongChoice:choice4];
                        }
                    }

                    break;
                case 4:
                    if([choice4 containsPoint:location]){
                        NSLog(@"Correct choice made");
                        [choice4 setFinished];
                        [self incrementWordCount];
                        [self dropTheOtherWordCards:choice4];
                        correctCounter ++;
                        correctCounterLabel.text = [NSString stringWithFormat:@"Correct: %i", correctCounter];
                    }else {
                        if([choice1 containsPoint:location]){
                            [self wrongChoice:choice1];
                        }else if ([choice2 containsPoint:location]){
                            [self wrongChoice:choice2];
                        }else if([choice3 containsPoint:location]){
                            [self wrongChoice:choice3];
                        }
                    }

                    break;
            }


        }
    }
}

-(void)update:(CFTimeInterval)currentTime{
    [self updateWordCard:keyCard];
    if(keyCard.isDoneMovingOnFinished || keyCard.isDoneMovingOnNew){
        [self updateWordCard:choice1];
        [self updateWordCard:choice2];
        [self updateWordCard:choice3];
        [self updateWordCard:choice4];
    }
}

-(BOOL)isDoneUpdatingCards{
    if(choice1.state == 1 && choice2.state == 1 && choice3.state == 1 && choice4.state == 1){
        return YES;
    }
    return NO;

}

-(void)updateWordCard:(WordCard*)aCard{
    if(![aCard isDoneMovingOnNew]){
        [aCard updateSizeAndPositionOnNew];
    }else if(![aCard isDoneMovingOnFinished] && aCard.state == 2){
        [keyCard updateSizeAndPositionOnFinish];
    }else if([aCard isDoneMovingOnFinished] && [aCard isDoneMovingOnNew] && aCard.state == 0){
        if(numOfWordsUsed != wordBank.count) {
            [self getNewWord:aCard];
        } else {
            [self transitionToResultScreen];
        }
    }
}

-(void)transitionToResultScreen{
    CGFloat score;
    CGFloat wordBankCount = [wordBank count];
    
    score = (wordBankCount - wrongCounter);
    score /= wordBankCount;
    
    if(score < 0){
        score = 0;
    }
    
    score = score * 100.0;
    if(score < 5) {
        score = 0;
    }
    
    SKTransition *reveal = [SKTransition flipVerticalWithDuration:1.0];
    QuizResultsScreen *resultScreen = [[QuizResultsScreen alloc]initWithSize: self.size andScore:score andQuizNumber:quizNumber andWordsInQuiz:wordBank];
    
    resultScreen.scaleMode = SKSceneScaleModeAspectFill;
    [self.scene.view presentScene: resultScreen transition:reveal];
}

-(void)clearWordsUsed{
    for(Word *obj in wordBank){
        [obj setUnused];
    }
}

-(void)getNewWord:(WordCard*)aCard{
    
    int tempRand;
    do{
        NSLog(@"Finding new word...");
        tempRand = arc4random() % [wordBank count];
        tempWord = [wordBank objectAtIndex:tempRand];
    }while(tempWord.used);
    [tempWord setUsed];
    [aCard setLabelTo:[tempWord getKey]];
    [self setChoicesStepOne:tempRand];

}

-(void)setChoicesStepOne:(int)index{
    int rand = arc4random() % 4;
    switch(rand){
        case 0:
            [self resetPositionOfChoice:choice1];
            [choice1 setLabelTo:[tempWord getValue]];
            [self setChoicesStepTwoCard1:choice2 Card2:choice3 Card3:choice4 exclude:index];
            correctCard = 1;
            break;
        case 1:
            [self resetPositionOfChoice:choice2];
            [choice2 setLabelTo:[tempWord getValue]];
            [self setChoicesStepTwoCard1:choice1 Card2:choice3 Card3:choice4 exclude:index];
            correctCard = 2;

            break;
        case 2:
            [self resetPositionOfChoice:choice3];
            [choice3 setLabelTo:[tempWord getValue]];
            [self setChoicesStepTwoCard1:choice1 Card2:choice2 Card3:choice4 exclude:index];
            correctCard = 3;

            break;
        case 3:
            [self resetPositionOfChoice:choice4];
            [choice4 setLabelTo:[tempWord getValue]];
            [self setChoicesStepTwoCard1:choice2 Card2:choice3 Card3:choice1 exclude:index];
            correctCard = 4;

            break;
    }
}
-(void)setChoicesStepTwoCard1:(WordCard*)card1 Card2:(WordCard*)card2 Card3:(WordCard*)card3 exclude:(int)correctIndex{
    int temp1, temp2, temp3;
    Word *incorrectWord1;
    Word *incorrectWord2;
    Word *incorrectWord3;

    do{
        temp1 = arc4random() % [wordBank count];
        temp2 = arc4random() % [wordBank count];
        temp3 = arc4random() % [wordBank count];
    }while(temp1 == temp2 || temp1 == temp3 || temp1 == correctIndex ||
           temp2 == temp3 || temp2 == correctIndex || temp3 == correctIndex);
    incorrectWord1 = [wordBank objectAtIndex:temp1];
    [self resetPositionOfChoice:card1];
    [card1 setLabelTo:[incorrectWord1 getValue]];
    incorrectWord2 = [wordBank objectAtIndex:temp2];
    [self resetPositionOfChoice:card2];
    [card2 setLabelTo:[incorrectWord2 getValue]];
    incorrectWord3 = [wordBank objectAtIndex:temp3];
    [self resetPositionOfChoice:card3];
    [card3 setLabelTo:[incorrectWord3 getValue]];
    
    
}

-(void)incrementWordCount{
    if(numOfWordsUsed < (int)[wordBank count]-1){
        numOfWordsUsed++;
        NSLog(@"Num of Words Used: %i Size of Word Bank: %lu", numOfWordsUsed, [wordBank count]);

    }
    else{
        [self transitionToResultScreen];
    }
}

-(void)wrongChoice:(WordCard*)aWordCard {
    [aWordCard.wordLabel runAction:[self fallOffTheBoardWithStartingY:aWordCard.wordLabel.position.y]];
    [aWordCard.sprite runAction:[self fallOffTheBoardWithStartingY:aWordCard.sprite.position.y]];
    wrongCounter++;
    wrongCounterLabel.text = [NSString stringWithFormat:@"Wrong: %i", wrongCounter];
}

-(void)dropTheOtherWordCards:(WordCard*)rightWord {
    if(rightWord != choice1) {
        choice1.wordLabel.zRotation = 1.4;
        choice1.sprite.zRotation = 1.4;

        [choice1.wordLabel runAction:[self fallOffTheBoardWithStartingY:choice1.wordLabel.position.y]];
        [choice1.sprite runAction:[self fallOffTheBoardWithStartingY:choice1.sprite.position.y]];
    }
    if(rightWord != choice2) {
        choice2.wordLabel.zRotation = 1.4;
        choice2.sprite.zRotation = 1.4;
        
        [choice2.wordLabel runAction:[self fallOffTheBoardWithStartingY:choice2.wordLabel.position.y]];
        [choice2.sprite runAction:[self fallOffTheBoardWithStartingY:choice2.sprite.position.y]];
    }
    if(rightWord != choice3) {
        choice3.wordLabel.zRotation = 1.4;
        choice3.sprite.zRotation = 1.4;
        
        [choice3.wordLabel runAction:[self fallOffTheBoardWithStartingY:choice3.wordLabel.position.y]];
        [choice3.sprite runAction:[self fallOffTheBoardWithStartingY:choice3.sprite.position.y]];
    }
    if(rightWord != choice4) {
        choice4.wordLabel.zRotation = 1.4;
        choice4.sprite.zRotation = 1.4;
        
        [choice4.wordLabel runAction:[self fallOffTheBoardWithStartingY:choice4.wordLabel.position.y]];
        [choice4.sprite runAction:[self fallOffTheBoardWithStartingY:choice4.sprite.position.y]];
    }
}

-(SKAction*)fallOffTheBoardWithStartingY:(CGFloat)yCoord {
    SKAction *fallOff = [SKAction moveToY:-1500 + yCoord duration:0.9f];
    return fallOff;
}

-(void)resetPositionOfChoice:(WordCard*)card {
    if(card == choice1) {
        [choice1 setPositionTo:choice1Pos];
    }
    if(card == choice2) {
        [choice2 setPositionTo:choice2Pos];
    }
    if(card == choice3) {
        [choice3 setPositionTo:choice3Pos];
    }
    if(card == choice4) {
        [choice4 setPositionTo:choice4Pos];
    }
}
@end
