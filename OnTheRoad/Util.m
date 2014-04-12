//
//  Util.m
//  Colors
//
//  Created by Heverton Rodrigues on 02/10/13.
//  Copyright (c) 2013 Heverton Rodrigues. All rights reserved.
//

#import "Util.h"
//#import "AFNetworking.h"

@interface Util ()

@end

int gameLanguageID = 1;

CLLocationManager *locationManager;

@implementation Util


+ (int)getLanguageID
{
    return gameLanguageID;
}

+ (void)setLanguageID:(int)langID
{
    gameLanguageID = langID;
}


+ (void)sendData:(NSString*)url :(NSDictionary*)params
{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSLog(@"params: %@", params);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"params: %@", params);
//        NSLog(@"Error: %@", error);
//        NSLog(@"response: %@", operation.responseString);
//    }];
}


+ (NSString *)getDeviceName
{
    NSString *deviceName = @"Name of iPhone";
    deviceName = [[UIDevice currentDevice] name];
    NSArray *toRemove = [NSArray arrayWithObjects:@"'", @"\"", @"<", @">", nil];
    for (NSString *currentChar in toRemove) deviceName = [deviceName stringByReplacingOccurrencesOfString:currentChar withString:@""];
    if ([deviceName isEqualToString:@""]) deviceName = @"no name";
    return [NSString stringWithFormat:@"%@", deviceName];
}

+ (NSString *)getDeviceLocation:(NSString*)coord
{
    //get device location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; // 100 m
    [locationManager startUpdatingLocation];
    
    if ( [coord isEqualToString:@"lat"] ) {
        return [NSString stringWithFormat:@"%f", locationManager.location.coordinate.latitude];
    } else {
        return [NSString stringWithFormat:@"%f", locationManager.location.coordinate.longitude];
    }
    
}



+ (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end