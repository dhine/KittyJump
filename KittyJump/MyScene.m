//
//  MyScene.m
//  KittyJump
//
//  Created by David Hine on 3/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        self.currentBackground = [Background generateNewBackground];
        [self addChild:self.currentBackground];
    }
    return self;
}
-(void)update:(NSTimeInterval)currentTime {
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) {
        timeSinceLast = 1.0 / 60.0;
    }
    
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
    }];
}

@end
