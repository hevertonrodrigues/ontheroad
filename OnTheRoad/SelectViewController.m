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
    
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    [self initComponents];
}


- (void)initComponents
{
    placesView = [[UIScrollView alloc] initWithFrame:CGRectMake( 0, 20 , screenW , ( screenH - 20 ) / 2 )];
    placesView.pagingEnabled = YES;
    placesView.showsHorizontalScrollIndicator = NO;
    placesView.showsVerticalScrollIndicator = NO;
    placesView.contentSize = CGSizeMake( screenW * 5,  ( screenH - 20 ) / 2 );
    
    UIButton *folder = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, placesView.frame.size.width, placesView.frame.size.height)];
    folder.backgroundColor = [UIColor clearColor];
    UIImageView *folderBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, folder.frame.size.width, folder.frame.size.height )];
    folderBG.image = [UIImage imageNamed:@"folder"];
    [folder addSubview:folderBG];
    
    UILabel *experience = [[UILabel alloc] initWithFrame:CGRectMake( 40, 20, 200, 40)];
    experience.text = @"EXPERIENCE";
    experience.font = [UIFont fontWithName:@"" size:18];
    experience.textColor = [Util colorWithHexString:@"563F03"];
    [folder addSubview:experience];
    
    UILabel *local = [[UILabel alloc] initWithFrame:CGRectMake( 40, 70, 200, 40)];
    local.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"LAST_SEARCH"];
    local.font = [UIFont fontWithName:@"" size:18];
    local.textColor = [Util colorWithHexString:@"563F03"];
    [folder addSubview:local];
    
    UIButton *toSee = [[UIButton alloc] initWithFrame:CGRectMake(placesView.frame.size.width, 0, placesView.frame.size.width, placesView.frame.size.height)];
    toSee.tag = 1;
    toSee.backgroundColor = [UIColor clearColor];
    UIImageView *toSeeBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, toSee.frame.size.width, toSee.frame.size.height )];
    toSeeBG.image = [UIImage imageNamed:@"tosee"];
    [toSee addSubview:toSeeBG];
    [toSee addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *toEat = [[UIButton alloc] initWithFrame:CGRectMake( placesView.frame.size.width * 2, 0, placesView.frame.size.width, placesView.frame.size.height)];
    toEat.tag = 2;
    toEat.backgroundColor = [UIColor clearColor];
    UIImageView *toEatBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, toEat.frame.size.width, toEat.frame.size.height )];
    toEatBG.image = [UIImage imageNamed:@"toeat"];
    [toEat addSubview:toEatBG];
    [toEat addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *toDo = [[UIButton alloc] initWithFrame:CGRectMake( placesView.frame.size.width * 3, 0, placesView.frame.size.width, placesView.frame.size.height)];
    toDo.tag = 3;
    toDo.backgroundColor = [UIColor clearColor];
    UIImageView *toDoBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, toDo.frame.size.width, toDo.frame.size.height )];
    toDoBG.image = [UIImage imageNamed:@"todo"];
    [toDo addSubview:toDoBG];
    [toDo addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *coolest = [[UIButton alloc] initWithFrame:CGRectMake( placesView.frame.size.width * 4, 0, placesView.frame.size.width, placesView.frame.size.height)];
    coolest.tag = 4;
    coolest.backgroundColor = [UIColor clearColor];
    UIImageView *coolestBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, coolest.frame.size.width, coolest.frame.size.height )];
    coolestBG.image = [UIImage imageNamed:@"coolest"];
    [coolest addSubview:coolestBG];
    [coolest addTarget:self action:@selector(openPlaces:) forControlEvents:UIControlEventTouchUpInside];
    
    
    mapsView = [[UIButton alloc] initWithFrame: CGRectMake( 0, ( ( screenH - 20 ) / 2 ) + 20, screenW, ( screenH - 20 ) / 2 )];
    mapsView.backgroundColor = [UIColor greenColor];
    UIImageView *mapsBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mapsView.frame.size.width, mapsView.frame.size.height )];
    mapsBG.image = [UIImage imageNamed:@"travellers"];
    [mapsView addSubview:mapsBG];
    [mapsView addTarget:self action:@selector(openMaps:) forControlEvents:UIControlEventTouchUpInside];
    
    [placesView addSubview:folder];
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
