//
//  catPlayer.h
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
typedef enum catState {
    playerStateRunning = 0,
    playerStateJumping,
    playerStateFalling
}catState;


@interface catPlayer : SKSpriteNode

@property (assign,nonatomic)catState playerState;

-(void)doJump:(catState)playerState;
@end
