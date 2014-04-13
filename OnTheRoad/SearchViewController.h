//
//  SearchViewController.h
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITextFieldDelegate>
{
    UIImageView *logo;
    UIImageView *slogan;
    UIImageView *bottom_logo;
    UITextField *where;
    UIButton *search;
    int screenW;
    int screenH;
}

@end
