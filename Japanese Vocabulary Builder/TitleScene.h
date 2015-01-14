//
//  MyScene.h
//  Japanese Vocabulary Builder
//

//  Copyright (c) 2014 Robert Payne. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TitleScene : SKScene{
    NSMutableArray *wordBank;
    CGSize viewSize;
    SKLabelNode *myLabel;
    SKLabelNode *hiraganaLabel;
    SKLabelNode *katakanaLabel;
    SKSpriteNode *menuLabel;
    SKSpriteNode *backgroundImage;
    SKSpriteNode *kaomojiMan;
    SKSpriteNode *cloudOne;
    SKSpriteNode *cloudTwo;
    SKSpriteNode *cloudThree;
    SKSpriteNode *japaneseText;
    BOOL isFadingOut;
    
}

@end
