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
    placesView.contentSize = CGSizeMake( screenW * 2,  ( screenH - 20 ) / 2 );
    
    UIButton *placeOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, placesView.frame.size.width, placesView.frame.size.height)];
    placeOne.tag = 1;
    placeOne.backgroundColor = [UIColor redColor];
    [placeOne addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *placeTwo = [[UIButton alloc] initWithFrame:CGRectMake(placesView.frame.size.width, 0, placesView.frame.size.width, placesView.frame.size.height)];
    placeTwo.tag = 2;
    placeTwo.backgroundColor = [UIColor blueColor];
    [placeTwo addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    
    mapsView = [[UIButton alloc] initWithFrame: CGRectMake( 0, ( ( screenH - 20 ) / 2 ) + 20, screenW, ( screenH - 20 ) / 2 )];
    mapsView.backgroundColor = [UIColor greenColor];
    [mapsView addTarget:self action:@selector(openMaps:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [placesView addSubview:placeOne];
    [placesView addSubview:placeTwo];
    
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
                category = @"praias";
            break;
        case 2:
                category = @"bares";
            break;
        default:
                category = @"todas";
            break;
    }
    
    [results setCategory: category];
    [results setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:results animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [Util getPlaces:[NSDictionary dictionaryWithObject: [[NSUserDefaults standardUserDefaults] stringForKey:@"LAST_SEARCH"] forKey:@"place"]];
}

@end
