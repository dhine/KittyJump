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
static NSInteger backgroundMoveSpeed = 100;
static NSString * backgroundName = @"background";
static NSInteger globalGravity = -4.8;



//main player
static NSString * mainPlayer = @"cat";
static NSInteger mainPlayerMass = 80;
static NSInteger catJumpForce = 32000;
static NSInteger catSuperJumpForce = 35000;
static float mainPlayerRestitution = 0;

//bitmasks
static const uint32_t backgroundCategory = 1;
static const uint32_t playerCategory = 2;
static const uint32_t groundCategory = 4;
static const uint32_t enemyCategory = 8;


#endif
