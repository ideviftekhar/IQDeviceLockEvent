//
//  ViewController.m
//  Device Lock Event
//
//  Created by Iftekhar 4 on 29/03/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "ViewController.h"
#import "IQDeviceLockEvent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lockStateChanged:) name:IQDeviceLockStateDidChangeNotification object:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)lockStateChanged:(NSNotification*)notification
{
    NSLog(@"%@",notification.userInfo);
    
    NSLog(@"%d",[IQDeviceLockEvent lockState]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
