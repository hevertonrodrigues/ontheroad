//
//  Util.h
//  Colors
//
//  Created by Heverton Rodrigues on 02/10/13.
//  Copyright (c) 2013 Heverton Rodrigues. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AFNetworking.h"


@interface Util : UIViewController

    + (int)getLanguageID;

    + (void)setLanguageID:(int)langID;

    + (UIColor*)colorWithHexString:(NSString*)hex;

    + (NSString *)getDeviceName;

    + (NSString *)getDeviceLocation:(NSString*)coord;

    + (NSArray*)getPlacesByCategory: (NSString*)_category;

    + (NSArray*)getUsersOnMap;

    + (void)getPlaces:(NSDictionary*)params;
    + (void)sendData:(NSString*)url :(NSArray*)params;
    + (void)sendLogin:(NSDictionary*)params;

    @property (nonatomic, weak) IBOutlet UIButton *gameLanguageID;

@end
