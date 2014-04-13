//
//  ViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "SignUpViewController.h"
#import "Util.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    latitude = [Util getDeviceLocation:@"lat"];
    longitude = [Util getDeviceLocation:@"long"];
}

- (void)viewDidAppear:(BOOL)animated
{
    if ( [[NSUserDefaults standardUserDefaults] stringForKey:@"USER_ID"] ) {
        SearchViewController *search = [[SearchViewController alloc] init];
        [search setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:search animated:YES completion:nil];
    } else {
        SignUpViewController *signup = [[SignUpViewController alloc] init];
        [signup setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:signup animated:YES completion:nil];
    }
}


@end
