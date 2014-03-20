//
//  MyScene.h
//  KittyJump
//

//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Background.h"

@class Background;
@interface MyScene : SKScene

@property (strong,nonatomic) Background *currentBackground;
@property (assign) CFTimeInterval lastUpdateTimeInterval;

@end
