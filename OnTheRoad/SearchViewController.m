//
//  SearchViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "SearchViewController.h"
#import "Util.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    
    
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake( 100, 100 , 120 , 120 )];
    logo.backgroundColor = [UIColor blackColor];
    
    
    UITextView *where = [[UITextView alloc] initWithFrame:CGRectMake( 40 , 360, 240, 40 )];
    where.backgroundColor = [UIColor whiteColor];
    
    
    
    
    [self.view addSubview:logo];
    [self.view addSubview:where];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
