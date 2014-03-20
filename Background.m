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
    
    
    return background;
}
@end
