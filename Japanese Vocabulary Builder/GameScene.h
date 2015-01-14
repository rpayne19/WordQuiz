//
//  GameScene.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 5/23/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "WordCard.h"
#import "Word.h"

@interface GameScene : SKScene{
    NSMutableArray  *wordBank;
    SKLabelNode     *correctCounterLabel;
    SKLabelNode     *wrongCounterLabel;
    NSString       *quizNumber;
    
    WordCard        *keyCard;
    WordCard        *choice1;
    WordCard        *choice2;
    WordCard        *choice3;
    WordCard        *choice4;
    Word            *tempWord;
    
    CGPoint         choice1Pos;
    CGPoint         choice2Pos;
    CGPoint         choice3Pos;
    CGPoint         choice4Pos;
    
    int             numOfWordsUsed;
    int             correctCard;
    int             correctCounter;
    int             wrongCounter;
    
    BOOL            isDoneUpdatingCards;
}

-(id)initWithSize:(CGSize)size andWordBank:(NSMutableArray*)words andQuizNumber:(NSString*)quizNumber;

@end
