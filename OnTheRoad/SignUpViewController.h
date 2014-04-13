//
//  SignUpViewController.h
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SignUpViewController : UIViewController<FBLoginViewDelegate, UITextFieldDelegate>
{
    UITextField *name;
    UITextField *email;
    UIButton *send;
}

@end
