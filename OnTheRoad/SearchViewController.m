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
    
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake( 100, 20 , 120 , 120 )];
    logo.backgroundColor = [UIColor blackColor];
   
    where = [[UITextField alloc] initWithFrame:CGRectMake( 40 , 260, 240, 40 )];
    where.delegate = self;
    where.backgroundColor = [UIColor whiteColor];
    
    
    search = [[UIButton alloc] initWithFrame:CGRectMake( 100, 350, 120, 40 )];
    search.backgroundColor = [Util colorWithHexString:@"563F03"];
    
    
    [self.view addSubview:logo];
    [self.view addSubview:where];
    [self.view addSubview:search];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
        [logo setFrame:CGRectMake( -120 , 20 , 120 , 120 ) ];
        [where setFrame:CGRectMake( 40 , 100 , 240 , 40 ) ];
        [search setFrame:CGRectMake( 100 , 160 , 120 , 40 ) ];
        //[UIView setAnimationDelegate:self];
        //[UIView setAnimationDidStopSelector:@selector(simulateDownBounceOne)];
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
                        [search setFrame:CGRectMake( 100, 380, 120, 40 ) ];
                     }
                     completion:^(BOOL finished){
                         // Wait one second and then fade in the view
                         [UIView animateWithDuration:0.3
                                               delay: 0.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                            [logo setFrame:CGRectMake( 100, 20 , 120 , 120 ) ];
                                            [where setFrame:CGRectMake( 40 , 260, 240, 40 ) ];
                                            [search setFrame:CGRectMake( 100, 350, 120, 40 ) ];
                                          }
                                          completion:nil];
                     }];
    [self.view endEditing:YES];
}

@end
