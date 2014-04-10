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
        self.physicsBody.restitution = 0;
        self.physicsBody.linearDamping = 0;
        self.physicsBody.friction = 0.5;
        
        
        self.physicsBody.categoryBitMask = playerCategory;
        self.physicsBody.mass = mainPlayerMass;
        
        self.physicsBody.allowsRotation = NO;
    }
    return self;
}

-(void)doJump:(catState)playerState
{
    if (self.playerState == playerStateRunning){
        [self.physicsBody applyImpulse:CGVectorMake(0, catJumpForce)];

        self.playerState = playerStateJumping;
    }
    else if (self.playerState == playerStateJumping){
        self.physicsBody.velocity = CGVectorMake(0, 0);
        [self.physicsBody applyImpulse:CGVectorMake(0, catSuperJumpForce)];
        SKAction *spinMove = [SKAction rotateByAngle:-M_PI*2 duration:0.5];
        [self runAction:spinMove];

        
        self.playerState = playerStateFalling;
    }
}
@end
