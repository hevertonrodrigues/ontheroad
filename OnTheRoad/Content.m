//
//  Content.m
//  DefesaCivil
//
//  Created by Heverton Rodrigues on 26/12/13.
//  Copyright (c) 2013 Heverton Rodrigues. All rights reserved.
//

#import "Content.h"

@implementation Content
@synthesize content_id, title, content, picture, latitude, longitude;

-(id)initWithData:(NSString*)_id :(NSString*)_title :(NSString*)_content :(NSString*)_picture :(NSString*)_lat :(NSString*)_long
{
    if (( self = [super init])){
        self.content_id = _id;
        self.title = _title;
        self.content = _content;
        self.picture = _picture;
        self.latitude = _lat;
        self.longitude = _long;
    }
    return self;
}

- (UIImage *)imageWithImage:(UIImage *)_img scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [_img drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)makeImage:(NSString*)url
{
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
}

@end
