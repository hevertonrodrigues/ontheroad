//
//  Content.h
//  DefesaCivil
//
//  Created by Heverton Rodrigues on 26/12/13.
//  Copyright (c) 2013 Heverton Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Content : NSObject
{
    NSString *content_id;
    NSString *title;
    NSString *content;
    NSString *picture;
    NSString *latitude;
    NSString *longitude;
}

-(id)initWithData:(NSString*)_id :(NSString*)_title :(NSString*)_content :(NSString*)_picture :(NSString*)_lat :(NSString*)_long;
- (UIImage *)makeImage:(NSString*)url;

@property (nonatomic, retain) NSString *content_id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *picture;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;

@end
