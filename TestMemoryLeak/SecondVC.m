//
//  SecondVC.m
//  TestMemoryLeak
//
//  Created by 李 双义 on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)dealloc{
    [mSV.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView *aIV = nil;
    for (int i = 0; i < 11; i ++) {
        aIV = [[UIImageView alloc]initWithFrame:CGRectMake(i * 200, 0, 200, 200)];
        aIV.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat: @"pad%d",i] ofType:@"png"]];
        [mSV addSubview:aIV];
        [aIV release];
    }
    mSV.contentSize = CGSizeMake(2200, 200);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)dismissSelf:(UIButton *)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
