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
    
    //create new background
    Background *background = [[Background alloc] initWithImageNamed:@"background.png"];
    
    //set anchorPoint, position,name, and ZPostion
    background.anchorPoint = CGPointMake(0, 0);
    background.position = CGPointMake(0, 0);
    background.name = backgroundName;
    background.zPosition = 1;
    
    //make floor of level w/ physics body
    background.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 30) toPoint:CGPointMake(background.size.width, 30)];
    //assign categorybitmask
    background.physicsBody.categoryBitMask = backgroundCategory;
    //set contact bitmask
    background.physicsBody.contactTestBitMask = playerCategory;
    
    //attach new node for ceiling collision body
    SKNode * ceilingCollide = [SKNode node];
    ceilingCollide.position = CGPointMake(0, 0);
    ceilingCollide.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, background.size.height - 30) toPoint:CGPointMake(background.size.width,background.size.height -10)];
    
    ceilingCollide.physicsBody.categoryBitMask = backgroundCategory;
    [background addChild:ceilingCollide];
    
    return background;
}
-(void)changeLane:(lanePositionState)position {
    if (position == lanePositionTop){
    
    }
}
@end
