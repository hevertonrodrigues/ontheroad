//
//  MapsViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "MapsViewController.h"
#import "Util.h"

@interface MapsViewController ()

@end

@implementation MapsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    self.view.backgroundColor = [Util colorWithHexString:@"563F03"];
}

@end
