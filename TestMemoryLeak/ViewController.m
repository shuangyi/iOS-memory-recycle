//
//  ViewController.m
//  TestMemoryLeak
//
//  Created by 李 双义 on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pushAVC:(UIButton *)sender{
    SecondVC *aVC = [[SecondVC alloc]initWithNibName:@"SecondVC" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:aVC];
    navi.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:navi animated:YES];
    [aVC release];
    [navi release];
    
}

@end
