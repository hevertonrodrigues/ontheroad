//
//  MapsViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "MapsViewController.h"
#import "Util.h"
#import "SelectViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "AFNetworking.h"

@interface MapsViewController ()

@end

@implementation MapsViewController
{
    GMSMapView *mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
   
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 4, screenW, 76)];
    header.image = [UIImage imageNamed:@"header_map"];
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake( screenW - 60, 25, 50, 50)];
    UIImageView *backBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    backBG.image = [UIImage imageNamed:@"back"];
    [back addSubview:backBG];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:header];
    [self.view addSubview:back];
    [self createMap];
}


- (void)createMap
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-23.760677
                                                            longitude:-46.4888692
                                                                 zoom:6];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake( 0, 80, screenW, screenH - 80 ) camera:camera];
    mapView.myLocationEnabled = YES;
    
    [self.view addSubview:mapView];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://www.globalbombas.com.br/ontheroad/find_users_on_map" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        

        for (id object in responseObject) {
            NSDictionary *currentObject = (NSDictionary*)object;

            if ( [currentObject valueForKey:@"lat"] &&  [currentObject valueForKey:@"long"] && [currentObject valueForKey:@"name"] )
            {
                GMSMarker *marker = [[GMSMarker alloc] init];
                marker.position = CLLocationCoordinate2DMake( [[currentObject valueForKey:@"lat"] doubleValue], [[currentObject valueForKey:@"long"] doubleValue] );
                //marker.position = CLLocationCoordinate2DMake( -38.86, 151.20 );
                marker.title = [currentObject valueForKey:@"name"];
                marker.icon = [UIImage imageNamed:@"bag"];
                //marker.snippet = @"Australia";
                marker.map = mapView;     
            }
        }
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"response: %@", operation.responseString);
    }];
    
   
//    NSArray *_places = [NSArray arrayWithObjects:
//                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Primeira Pessoa", @"name", @"-34.86", @"lat", @"151.20", @"long", nil],
//                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Segunda Pessoa", @"name", @"-38.86", @"lat", @"151.20", @"long", nil],
//                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Terceira Pessoa", @"name", @"-30.86", @"lat", @"151.20", @"long", nil],
//                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Quarta Pessoa", @"name", @"-20.86", @"lat", @"151.20", @"long", nil],
//                                                nil];
//    
//    NSLog(@"---------------------------- %@", _places);
//    
//    for (id object in _places) {
//        NSDictionary *currentObject = (NSDictionary*)object;
//        
//        GMSMarker *marker = [[GMSMarker alloc] init];
//        marker.position = CLLocationCoordinate2DMake( [[currentObject valueForKey:@"lat"] doubleValue], [[currentObject valueForKey:@"long"] doubleValue] );
//        marker.title = [currentObject valueForKey:@"name"];
//        marker.icon = [UIImage imageNamed:@"bag"];
//        marker.snippet = @"Australia";
//        marker.map = mapView;
//    }
    
    
//    for ( NSString *key in _places) {
//        NSLog(@"----------- %@", [_places objectAtIndex:[key integerValue]]);
//    }
    
    // Creates a marker in the center of the map.

}


- (void)back:(UIButton*)sender
{
    SelectViewController *select = [[SelectViewController alloc] init];
    [select setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:select animated:YES completion:nil];
}

@end
