//
//  SelectViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "SelectViewController.h"
#import "Util.h"
#import "ResultsViewController.h"
#import "MapsViewController.h"

@interface SelectViewController ()

@end

@implementation SelectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    self.view.backgroundColor = [Util colorWithHexString:@"563F03"];
    [self initComponents];
}


- (void)initComponents
{
    placesView = [[UIScrollView alloc] initWithFrame:CGRectMake( 0, 20 , screenW , ( screenH - 20 ) / 2 )];
    placesView.pagingEnabled = YES;
    placesView.showsHorizontalScrollIndicator = NO;
    placesView.showsVerticalScrollIndicator = NO;
    placesView.contentSize = CGSizeMake( screenW * 4,  ( screenH - 20 ) / 2 );
    
    UIButton *toSee = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, placesView.frame.size.width, placesView.frame.size.height)];
    toSee.tag = 1;
    toSee.backgroundColor = [UIColor redColor];
    [toSee addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *toEat = [[UIButton alloc] initWithFrame:CGRectMake( placesView.frame.size.width , 0, placesView.frame.size.width, placesView.frame.size.height)];
    toEat.tag = 2;
    toEat.backgroundColor = [UIColor greenColor];
    [toEat addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *toDo = [[UIButton alloc] initWithFrame:CGRectMake( placesView.frame.size.width * 2, 0, placesView.frame.size.width, placesView.frame.size.height)];
    toDo.tag = 3;
    toDo.backgroundColor = [UIColor redColor];
    [toDo addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *coolest = [[UIButton alloc] initWithFrame:CGRectMake( placesView.frame.size.width * 3, 0, placesView.frame.size.width, placesView.frame.size.height)];
    coolest.tag = 4;
    coolest.backgroundColor = [UIColor yellowColor];
    [coolest addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    
    mapsView = [[UIButton alloc] initWithFrame: CGRectMake( 0, ( ( screenH - 20 ) / 2 ) + 20, screenW, ( screenH - 20 ) / 2 )];
    mapsView.backgroundColor = [UIColor greenColor];
    [mapsView addTarget:self action:@selector(openMaps:) forControlEvents:UIControlEventTouchUpInside];
    
    [placesView addSubview:toSee];
    [placesView addSubview:toEat];
    [placesView addSubview:toDo];
    [placesView addSubview:coolest];
    
    [self.view addSubview:mapsView];
    [self.view addSubview:placesView];
}

- (void)openMaps:(UIButton*)button
{
    MapsViewController *maps = [[MapsViewController alloc] init];
    [maps setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:maps animated:YES completion:nil];
}

- (void)openPlaces:(UIButton*)button
{
    ResultsViewController *results = [[ResultsViewController alloc] init];
    NSString *category;
    switch ( button.tag ) {
        case 1:
                category = @"tosee";
            break;
        case 2:
                category = @"toeat";
            break;
        case 3:
                category = @"todo";
            break;
        case 4:
                category = @"coolest";
            break;
        default:
                category = @"coolest";
            break;
    }
    
    [results setCategory: category];
    [results setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:results animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSDictionary *_sendData = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[NSUserDefaults standardUserDefaults] stringForKey:@"USER_ID"], @"id",
                              [[NSUserDefaults standardUserDefaults] stringForKey:@"LAST_SEARCH"], @"target",
                              [Util getDeviceLocation:@"lat"], @"lat",
                              [Util getDeviceLocation:@"long"], @"long",
                              nil];
    [Util getPlaces:_sendData];
}

@end
