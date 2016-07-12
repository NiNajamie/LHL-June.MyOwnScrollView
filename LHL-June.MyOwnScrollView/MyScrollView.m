//
//  MyScrollView.m
//  LHL-June.MyOwnScrollView
//
//  Created by Asuka Nakagawa on 2016-07-11.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView ()

// A PanGestureRecognizer
@property (nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panTriggered:)];
        
        // Add panGestureRecognizer into view
        [self addGestureRecognizer:self.panGestureRecognizer];
        
        self.panGestureRecognizer.minimumNumberOfTouches = 1;
        self.panGestureRecognizer.maximumNumberOfTouches = 1;
        
        self.userInteractionEnabled = YES;

    }
    return self;
}

// In the method that handles events from the PanGestureRecognizer, look for how far you have panned.
- (void) panTriggered:(UIPanGestureRecognizer *)sender {
    
    // panGesturerecognizer comes first on the view
//    [self bringSubviewToFront:[(UIPanGestureRecognizer *)sender view]];
    
    // Get how far panned, translation:capturing where the point is,self=MyScrollView
    CGPoint translatedPoint = [sender translationInView:self];
    
//    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
//        NSLog(@"began");
    
    // bounds = CGRect(x,y,width,height) (20,30,w,h)view.frame// (0,0,w,h)window.bounds
    // we cannot set bounds, use center x
    CGRect bounds = self.bounds;
    
    bounds.origin.x -= translatedPoint.x;
    bounds.origin.y -= translatedPoint.y;
    
    // Set limitation
    self.contentSize = CGSizeMake(bounds.size.width-50, bounds.size.height-50);
    
//    BOOL inBoundsRight = bounds.origin.x < self.contentSize.width;
//    BOOL inBoundsLeft = bounds.origin.x > -self.contentSize.width;
    
    BOOL inBoundsY = fabs(bounds.origin.y) < self.contentSize.height;
    BOOL inBoundsX = fabs(bounds.origin.x) < self.contentSize.width;
    
    // bounds can move only within the contentSize
    if (inBoundsX && inBoundsY) {
        
        // update currentPosition
        self.bounds = bounds;
    }
    
    [sender setTranslation:CGPointZero inView:self];
    
//        CGFloat firstX = [[sender view] center].x;
//        CGFloat firstY = [[sender view] center].y;
//        translatedPoint = CGPointMake(firstX + translatedPoint.x, firstY);
    
//        [[sender view] setBounds:(CGRect)];
//    }
//    NSLog(@"panTriggered");
    
}


/*
// Only override drawRect: if you perform custom drawing.eg
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/






@end
