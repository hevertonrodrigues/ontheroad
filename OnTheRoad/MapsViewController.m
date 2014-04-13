//
//  MapsViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "MapsViewController.h"
#import "Util.h"
#import <GoogleMaps/GoogleMaps.h>

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
   
    self.view.backgroundColor = [Util colorWithHexString:@"563F03"];
    
    [self createMap];
}


- (void)createMap
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake( 0, 100, screenW, screenH - 100 ) camera:camera];
    mapView.myLocationEnabled = YES;
    
    [self.view addSubview:mapView];
   
    NSArray *_places = [NSArray arrayWithObjects:
                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Primeira Pessoa", @"name", @"-34.86", @"lat", @"151.20", @"long", nil],
                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Segunda Pessoa", @"name", @"-38.86", @"lat", @"151.20", @"long", nil],
                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Terceira Pessoa", @"name", @"-30.86", @"lat", @"151.20", @"long", nil],
                                                [NSDictionary dictionaryWithObjectsAndKeys:@"Quarta Pessoa", @"name", @"-20.86", @"lat", @"151.20", @"long", nil],
                                                nil];
    
    NSLog(@"---------------------------- %@", _places);
    
    for (id object in _places) {
        NSDictionary *currentObject = (NSDictionary*)object;
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake( [[currentObject valueForKey:@"lat"] doubleValue], [[currentObject valueForKey:@"long"] doubleValue] );
        marker.title = [currentObject valueForKey:@"name"];
        marker.icon = [UIImage imageNamed:@"bag"];
        marker.snippet = @"Australia";
        marker.map = mapView;
    }
    
    
//    for ( NSString *key in _places) {
//        NSLog(@"----------- %@", [_places objectAtIndex:[key integerValue]]);
//    }
    
    // Creates a marker in the center of the map.

}

@end
