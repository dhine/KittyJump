//
//  Common.h
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#ifndef KittyJump_Common_h
#define KittyJump_Common_h

//background properties
static NSInteger backgroundMoveSpeed = 200;
static NSString * backgroundName = @"background";
static NSInteger globalGravity = -4.8;



//player properties
static NSString * mainPlayer = @"cat";
static NSInteger mainPlayerMass = 80;
static NSInteger catJumpForce = 22000;
static NSInteger catSuperJumpForce = 25000;

//Category bitmasks
static const uint32_t backgroundCategory = 0x1;
static const uint32_t playerCategory = 0x1 << 1;
static const uint32_t groundCategory = 0x1 << 2;
static const uint32_t enemyCategory =  0x1 << 3;


#endif
