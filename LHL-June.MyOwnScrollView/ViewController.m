//
//  ViewController.m
//  LHL-June.MyOwnScrollView
//
//  Created by Asuka Nakagawa on 2016-07-11.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property (nonatomic) MyScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // add myScrollView into VC
    self.myScrollView = [[MyScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.myScrollView];
    
    // Set redBox inside of the UIScrollView
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redBox.backgroundColor = [UIColor redColor];
    [self.myScrollView addSubview:redBox];
    
    UIView *greenBox = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenBox.backgroundColor = [UIColor greenColor];
    [self.myScrollView addSubview:greenBox];
    
    UIView *blueBox = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueBox.backgroundColor = [UIColor blueColor];
    [self.myScrollView addSubview:blueBox];
    
    UIView *yellowBox = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowBox.backgroundColor = [UIColor yellowColor];
    [self.myScrollView addSubview:yellowBox];

}


-(void)viewDidAppear:(BOOL)animated {
    // calls superClass
    [super viewDidAppear:animated];
    
    // Set bounds (y)100points down with same as frame.size
    self.view.bounds = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
