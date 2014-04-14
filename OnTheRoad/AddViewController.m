//
//  AddViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "AddViewController.h"
#import "Util.h"
#import "SelectViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    
    [self initComponents];
    
}


-(void)initComponents
{
    UIImageView *shareExp = [[UIImageView alloc] initWithFrame:CGRectMake( 40, 40, 192, 74 )];
    shareExp.image = [UIImage imageNamed:@"share_exp"];
    
    
    
    name = [[UITextField alloc] initWithFrame:CGRectMake( 40 , ( screenH / 2 ) - 120, 240, 40 )];
    name.backgroundColor = [UIColor whiteColor];
    //name.delegate = self;
    name.layer.cornerRadius = 10;
    name.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    name.leftViewMode = UITextFieldViewModeAlways;
    name.placeholder = @"O QUE FOI FAZER?";
    
    email = [[UITextField alloc] initWithFrame:CGRectMake( 40 , ( screenH / 2 ) - 60 , 240, 280 )];
    email.backgroundColor = [UIColor whiteColor];
    //email.delegate = self;
    email.layer.cornerRadius = 10;
    email.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    email.leftViewMode = UITextFieldViewModeAlways;
    email.placeholder = @"COMO FOI?";
    
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake( screenW - 60, 25, 50, 50)];
    UIImageView *backBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    backBG.image = [UIImage imageNamed:@"back"];
    [back addSubview:backBG];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:name];
    [self.view addSubview:email];
    [self.view addSubview:back];
    [self.view addSubview:shareExp];
}

- (void)back:(UIButton*)sender
{
    SelectViewController *select = [[SelectViewController alloc] init];
    [select setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:select animated:YES completion:nil];
}

@end
