//
//  MyScene.m
//  KittyJump
//
//  Created by David Hine on 3/17/14.
//  Copyright (c) 2014 David Hine. All rights reserved.
//

#import "MyScene.h"
@implementation MyScene

//initialize nodes in scene
-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        self.currentBackground = [Background generateNewBackground];
        [self addChild:self.currentBackground];
        self.physicsWorld.contactDelegate = self;
        self.player = [[catPlayer alloc] init];
        
        self.player.position = CGPointMake(120, 65);
        [self addChild:self.player];
        
        self.physicsWorld.gravity = CGVectorMake(0, globalGravity);
    }
    return self;
}

-(void)tappedScreen
//(UITapGestureRecognizer *)recognizer
{
    //catPlayer *player = (catPlayer *) [self childNodeWithName:mainPlayer];
    [self.player doJump:self.player.playerState];
    
}

-(void) didMoveToView:(SKView *)view
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedScreen)];
    tap.numberOfTapsRequired = 1;
    
    [view addGestureRecognizer:tap];
}

//Called each Clock Cycle
-(void)update:(NSTimeInterval)currentTime {
    
    //Find out time since last update and assign current frame (Runs at 60 FPS)
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    //60 FPS
    if (timeSinceLast > 1) {
        timeSinceLast = 1.0 / 60.0;
    }
    //Infinite Background
    
        //Move background's "X" position by "backgroundmovespeed" each frame
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
        //If Background is off screen, remove from scene
    if (node.position.x < -(node.frame.size.width + 100)) {
        [node removeFromParent];
    }}];
        //When background goes on screen by entire width of background...generate new backgroung (previous block removes old background)
    if (self.currentBackground.position.x < -400) {
        //Generate new background off screen
        Background *temp = [Background generateNewBackground];
        //when on screen...add to screen
        temp.position = CGPointMake(self.currentBackground.position.x + self.currentBackground.frame.size.width - 5, 0);
        [self addChild:temp];
        self.currentBackground = temp;
    }
    NSLog(@"%d",self.player.playerState);
    
}
-(void)didBeginContact:(SKPhysicsContact *)contact {
    if (contact.bodyB.categoryBitMask == playerCategory) {
        NSLog(@"background hit");
        self.player.playerState = playerStateRunning;
    }

}
@end
