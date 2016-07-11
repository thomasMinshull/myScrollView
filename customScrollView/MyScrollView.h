//
//  myScrollView.h
//  customScrollView
//
//  Created by thomas minshull on 2016-07-11.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property (strong, nonatomic)UIPanGestureRecognizer *pan;
@property (assign, nonatomic) CGSize contentSize;

- (instancetype)initWithFrame:(CGRect)frame andContentSize:(CGSize)contentSize;

@end
