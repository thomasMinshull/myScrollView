//
//  ViewController.m
//  customScrollView
//
//  Created by thomas minshull on 2016-07-11.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
//    [self.view setBounds:CGRectMake(0.0, 100.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    CGSize contentSize = CGSizeMake(self.view.frame.size.width *1.125, self.view.frame.size.height * 1.125);
    
    MyScrollView *myScrollView = [[MyScrollView alloc] initWithFrame:self.view.frame andContentSize:contentSize];
    [self.view addSubview:myScrollView];
    
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150.0, 150.0, 150.0, 200.0)];
    greenView.backgroundColor = [UIColor greenColor];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40.0, 400.0, 200.0, 150.0)];
    blueView.backgroundColor = [UIColor blueColor];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100.0, 600.0, 180.0, 150.0)];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    NSArray *views = @[redView, greenView, blueView, yellowView];
    
    for (UIView *view in views) {
        [myScrollView addSubview:view];
    }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
