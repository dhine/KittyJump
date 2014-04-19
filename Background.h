//
//  Background.h
//  KittyJump
//
//  Created by David Hine on 3/19/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
typedef enum lanePositionState {
    lanePositionTop = 0,
    lanePositionMiddle,
    lanePositionBottom
}lanePositionState;

@interface Background : SKSpriteNode

+ (Background *)generateNewBackground;

@property SKNode *topLane;
@property SKNode *middleLane;
@property SKNode *bottomLane;

-(void)changeLane:(lanePositionState)position;

@end
