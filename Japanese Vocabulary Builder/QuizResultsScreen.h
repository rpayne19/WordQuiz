//
//  QuizResultsScreen.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 11/9/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "WordCard.h"
#import "Button.h"
@interface QuizResultsScreen : SKScene{
    SKLabelNode     *quizLabel;
    SKLabelNode     *scoreLabel;
    SKLabelNode     *numOfWordsInQuizLabel;
    SKLabelNode     *retryLabel;
    Button          *yesButton;
    Button          *noButton;
    NSMutableArray  *wordBank;
    NSString        *quizNum;
    
}

-(id)initWithSize:(CGSize) size andScore:(CGFloat)score andQuizNumber:(NSString*)aQuizNumber andWordsInQuiz:(NSMutableArray*)quizWords;

@end
