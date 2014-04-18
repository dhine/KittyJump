//
//  MyScene.h
//  KittyJump
//

//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Background.h"
#import "catPlayer.h"
#import "carEnemy.h"
#import "GameOverScene.h"

@class Background;
@interface MyScene : SKScene <SKPhysicsContactDelegate>

@property (strong,nonatomic)Background *currentBackground;
@property (strong,nonatomic)catPlayer *player;
@property (assign) CFTimeInterval lastUpdateTimeInterval;

@property  (strong) UIGestureRecognizer * tap;

@end
