//
//  Common.h
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#ifndef KittyJump_Common_h
#define KittyJump_Common_h

static NSInteger backgroundMoveSpeed = 100;
static NSString * backgroundName = @"background";
static NSString * mainPlayer = @"cat";

//Physics
static NSInteger mainPlayerMass = 80;
static NSInteger mainPlayerCollisionBitMask = 1;
static NSInteger catJumpForce = 3000000;
static NSInteger globalGravity = -5.8;
#endif
