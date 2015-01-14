//
//  QuizSelectionScene.h
//  Japanese Vocabulary Builder
//
//  Created by Robert Payne on 9/19/14.
//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface QuizSelectionScene : SKScene{
    NSMutableArray *wordBank;
    CGSize viewSize;
    SKLabelNode *myLabel;           //Remove
    SKLabelNode *hiraganaLabel;     //Remove
    SKLabelNode *katakanaLabel;     //Remove
    SKLabelNode *menuLabel;         //Remove
    SKLabelNode *quiz1;
    SKLabelNode *quiz2;
    SKLabelNode *quiz3;
    SKLabelNode *quiz4;
    SKLabelNode *quiz5;
    SKLabelNode *quiz6;
}

@end
