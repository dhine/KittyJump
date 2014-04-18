//
//  carEnemy.m
//  KittyJump
//
//  Created by David Hine on 4/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "carEnemy.h"

@implementation carEnemy

-(instancetype)init {
 
    self = [super initWithImageNamed:@"redCar"];
    {
        self.name = redCarEnemy;
        self.zPosition = 10;
        //apply physics body
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.width, self.size.height)];
        self.physicsBody.dynamic=YES;
        self.physicsBody.restitution = 0;
        self.physicsBody.linearDamping = 0;
        self.physicsBody.friction = 0.5;
        
        
        self.physicsBody.categoryBitMask = enemyCategory;
        self.physicsBody.contactTestBitMask = playerCategory;
        self.physicsBody.mass = 800;
        
        self.physicsBody.allowsRotation = NO;

    }
    return self;
};


@end
