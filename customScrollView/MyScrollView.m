//
//  myScrollView.m
//  customScrollView
//
//  Created by thomas minshull on 2016-07-11.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame andContentSize:(CGSize)contentSize {
    self = [super initWithFrame:frame];
    if (self) {
        self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scroll)];
        [self addGestureRecognizer:self.pan];
        
        float height = 0.0;
        if (contentSize.height >= frame.size.height ) {
            height = contentSize.height;
        } else {
            height = frame.size.height;
        }
        
        float width = 0.0;
        if (contentSize.width >= frame.size.width) {
            width = contentSize.width;
        } else {
            width = frame.size.width;
        }
        
        self.contentSize = CGSizeMake(width, height);
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)scroll {
    float newX = self.bounds.origin.x - [self.pan translationInView:self].x;
    float newY = self.bounds.origin.y - [self.pan translationInView:self].y;
    
    if (0 <= ABS(newX)
         && ABS(newX) <= ABS(0 + self.contentSize.width) - ABS(self.bounds.size.width)
        && 0 <= ABS(newY)
        && ABS(newY) <= ABS(0 + self.contentSize.height) - ABS(self.bounds.size.height)) {
        // scrolled to location in content view
        self.bounds = CGRectMake(newX, newY, self.bounds.size.width, self.bounds.size.height);
    } else {
        // scroll hits boarder of contentsize
        
        if (0 > ABS(newX)) {
            newX = 0;
        }
        
        if (ABS(newX) > ABS(0 + self.contentSize.width) - ABS(self.bounds.size.width)) {
//            newX = self.contentSize.width - self.bounds.size.width;
            newX = self.bounds.origin.x; // if at edge don't go further
        }
        
        if (0 > ABS(newY)) {
            newY = 0;
        }
        
        if (ABS(newY) > ABS(0 + self.contentSize.height) - ABS(self.bounds.size.height)) {
            newY = self.bounds.origin.y; // if at edge don't go further 
        }
        self.bounds = CGRectMake(newX, newY, self.bounds.size.width , self.bounds.size.height);
    }
    [self.pan setTranslation:CGPointZero inView:self];
}

@end
