//
//  GameOverScene.m
//  KittyJump
//
//  Created by David Hine on 4/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "GameOverScene.h"
#import "MyScene.h"
@implementation GameOverScene

-(instancetype) initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        self.backgroundColor = [UIColor blackColor];
        SKLabelNode *gameOverTitle = [[SKLabelNode alloc] init];
        gameOverTitle.text = @"Game Over";
        gameOverTitle.color = [UIColor whiteColor];
        gameOverTitle.position = CGPointMake(self.size.width/2, self.size.height/2);
        
        SKLabelNode *tryAgainButton = [[SKLabelNode alloc] init];
        tryAgainButton.text = @"Tap Here to Try Agian";
        tryAgainButton.position = CGPointMake(self.size.width/2, self.size.height * 0.75);
        
        [self addChild:gameOverTitle];
        [self addChild:tryAgainButton];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    MyScene *newGame = [[MyScene alloc] initWithSize:self.size];
    [self.view presentScene:newGame transition:[SKTransition doorsOpenHorizontalWithDuration:1.5]];
    
}

@end
