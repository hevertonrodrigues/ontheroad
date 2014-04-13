//
//  SearchViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "SearchViewController.h"
#import "Util.h"
#import "SelectViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    [self initComponents];
}


- (void)initComponents
{
    logo = [[UIImageView alloc] initWithFrame:CGRectMake( 20, 80 , 72 , 83 )];
    logo.image = [UIImage imageNamed:@"main_logo"];
    
    bottom_logo = [[UIImageView alloc] initWithFrame:CGRectMake( screenW - 80 , screenH - 80 , 75 , 73 )];
    bottom_logo.image = [UIImage imageNamed:@"bottom_logo"];
    
    slogan = [[UIImageView alloc] initWithFrame:CGRectMake( 110, 70 , 185 , 92 )];
    slogan.image = [UIImage imageNamed:@"slogan"];
   
    where = [[UITextField alloc] initWithFrame:CGRectMake( 40 , screenH / 2, 240, 40 )];
    where.delegate = self;
    where.layer.cornerRadius = 10;
    where.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    where.leftViewMode = UITextFieldViewModeAlways;
    where.backgroundColor = [UIColor whiteColor];
    
    search = [[UIButton alloc] initWithFrame:CGRectMake( 125, ( screenH / 2 ) + 70, 70, 40 )];
    UIImageView *bgSearch = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 40)];
    bgSearch.image = [UIImage imageNamed:@"btn_search"];
    search.backgroundColor = [UIColor clearColor];
    [search addSubview:bgSearch];
    [search addTarget:self action:@selector(searchPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:logo];
    [self.view addSubview:bottom_logo];
    [self.view addSubview:slogan];
    [self.view addSubview:where];
    [self.view addSubview:search];
}




- (void)searchPlaces:(UIButton*)sender
{
    if ( [where.text length] > 1 )
    {
        [[NSUserDefaults standardUserDefaults] setValue: where.text forKey:@"LAST_SEARCH"];
        [self selectView];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Ops..."
                                                        message: @"Digite o local que deseja ir"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    [UIView animateWithDuration:0.1
//                          delay: 0.0
//                        options: UIViewAnimationOptionCurveEaseOut
//                     animations:^{
//                        [logo setFrame:CGRectMake( 20, -180 , 72 , 83 ) ];
//                     }
//                     completion:^(BOOL finished){
//                         // Wait one second and then fade in the view
//                         [UIView animateWithDuration:0.1
//                                               delay: 0.0
//                                             options:UIViewAnimationOptionCurveEaseOut
//                                          animations:^{
//                                            [slogan setFrame:CGRectMake( -190, 70 , 185 , 92 ) ];
//                                          }
//                                         completion:^(BOOL finished){
//                                             [UIView animateWithDuration:0.1
//                                                                   delay: 0.0
//                                                                 options:UIViewAnimationOptionCurveEaseOut
//                                                              animations:^{
//                                                                [where setFrame:CGRectMake( 40 , 100 , 240 , 40 ) ];
//                                                                [search setFrame:CGRectMake( 100 , 180 , 120 , 40 ) ];
//                                                              }
//                                                             completion:^(BOOL finished){
//                                                             }];
//                                         }];
//                     }];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
        [logo setFrame:CGRectMake( -120, 80 , 72 , 83 ) ];
        [slogan setFrame:CGRectMake( 110, -270 , 185 , 92 ) ];
        [where setFrame:CGRectMake( 40 , 100 , 240 , 40 ) ];
        [search setFrame:CGRectMake( 125 , 180 , 70 , 40 ) ];
    [UIView commitAnimations];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Fade out the view right away
    [UIView animateWithDuration:0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                        [logo setFrame:CGRectMake( 140 , 20 , 120 , 120 ) ];
                        [where setFrame:CGRectMake( 40 , 280, 240, 40 ) ];
                        [search setFrame:CGRectMake( 125, 380, 70, 40 ) ];
                     }
                     completion:^(BOOL finished){
                         // Wait one second and then fade in the view
                         [UIView animateWithDuration:0.3
                                               delay: 0.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                            [logo setFrame:CGRectMake( 20, 80 , 72 , 83 ) ];
                                            [slogan setFrame:CGRectMake( 110, 70 , 185 , 92 ) ];
                                            [where setFrame:CGRectMake( 40 , screenH / 2, 240, 40 ) ];
                                            [search setFrame:CGRectMake( 125, ( screenH / 2 ) + 70, 120, 40 ) ];
                                          }
                                          completion:nil];
                     }];
    [self.view endEditing:YES];
}


- (void) selectView
{
    SelectViewController *select = [[SelectViewController alloc] init];
    [select setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:select animated:YES completion:nil];
}

@end
