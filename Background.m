//
//  Background.m
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "Background.h"
#import "Common.h"
@implementation Background

+ (Background *)generateNewBackground {
    
    Background *background = [[Background alloc] initWithImageNamed:@"background.png"];
    background.anchorPoint = CGPointMake(0, 0);
    background.position = CGPointMake(0, 0);
    background.name = backgroundName;
    background.zPosition = 1;
    
    //make floor of level
    background.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 30) toPoint:CGPointMake(background.size.width, 30)];
    
    //background can collide with player
    background.physicsBody.collisionBitMask = mainPlayerCollisionBitMask;
    
    //attach new node for ceiling collision body
    SKNode * ceilingCollide = [SKNode node];
    ceilingCollide.position = CGPointMake(0, 0);
    ceilingCollide.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, background.size.height - 30) toPoint:CGPointMake(background.size.width,background.size.height -30)];
    
    ceilingCollide.physicsBody.collisionBitMask = 1;
    [background addChild:ceilingCollide];
    
    return background;
}
@end
