//
//  catPlayer.m
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "catPlayer.h"

@implementation catPlayer

-(instancetype)init
{
    self = [super initWithImageNamed:@"mainCharacter.png"];
    {   self.name = mainPlayer;
        self.zPosition = 10;
        //apply physics body
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.width, self.size.height)];
        self.physicsBody.dynamic=YES;
    
        self.physicsBody.mass = mainPlayerMass;
        self.physicsBody.collisionBitMask = mainPlayerCollisionBitMask;
        self.physicsBody.allowsRotation = NO;
    }
    return self;
}

-(void)doJump:(catState)playerState
{
    if (playerState == playerStateRunning){
        self.playerState = playerStateJumping;
    }
}

@end
