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
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    
    bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    if ( screenH == 480 ) {
        bg.image = [UIImage imageNamed:@"splash"];
    } else {
        bg.image = [UIImage imageNamed:@"splash5"];
    }
    
    [self.view addSubview:bg];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Fade out the view right away
    [UIView animateWithDuration:0.5
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         bg.frame = CGRectMake( 0, -700, screenW, screenH );
                     }
                     completion:^(BOOL finished){
                        if ( [[NSUserDefaults standardUserDefaults] stringForKey:@"USER_ID"] ) {
                            SearchViewController *search = [[SearchViewController alloc] init];
                            [search setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
                            [self presentViewController:search animated:YES completion:nil];
                        } else {
                            SignUpViewController *signup = [[SignUpViewController alloc] init];
                            [signup setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
                            [self presentViewController:signup animated:YES completion:nil];
                        }
                     }];
}


@end
