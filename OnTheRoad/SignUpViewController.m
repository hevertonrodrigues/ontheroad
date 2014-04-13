//
//  SignUpViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "SignUpViewController.h"
#import "Util.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    
    [self initComponents];
    [[NSUserDefaults standardUserDefaults] setValue: @"blocked" forKey:@"SECURITY"];
}



- (void) initComponents
{
    name = [[UITextField alloc] initWithFrame:CGRectMake( 40 , 120, 240, 40 )];
    name.backgroundColor = [UIColor whiteColor];
    name.placeholder = @"NOME";
    
    email = [[UITextField alloc] initWithFrame:CGRectMake( 40 , 220, 240, 40 )];
    email.backgroundColor = [UIColor whiteColor];
    email.placeholder = @"EMAIL";
    
    
    FBLoginView *loginView = [[FBLoginView alloc] init];
    
 
    loginView.defaultAudience = FBSessionDefaultAudienceEveryone;
    //loginView.publishPermissions = @[@"publish_stream"];
    loginView.readPermissions = @[@"basic_info", @"email"];
    loginView.delegate = self;


    loginView.frame = CGRectMake( 40, 320, 240, 50);
    
    
    //if (!FBSession.activeSession.isOpen)
    //{
        [self.view addSubview:loginView];
    //}


    
    
    [self.view addSubview:name];
    [self.view addSubview:email];
}

// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    //self.profilePictureView.profileID = user.id;
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        NSDictionary *sendData = [[NSDictionary alloc] initWithObjectsAndKeys:user.name, @"name",
                                                                                            [result objectForKey:@"email"], @"email",
                                                                                            nil];
        
       [Util sendLogin:sendData];
        
        
        NSLog(@"%@", user.name);
        NSLog(@"%@", [result objectForKey:@"gender"]);
        NSLog(@"%@", [result objectForKey:@"hometown"]);
        NSLog(@"%@", [result objectForKey:@"birthday"]);
        NSLog(@"%@", [result objectForKey:@"email"]);
    }];
}

// Implement the loginViewShowingLoggedInUser: delegate method to modify your app's UI for a logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    //self.statusLabel.text = @"You're logged in as";
    //loginView.frame = CGRectMake(0, 0, 0, 0);
}

// Implement the loginViewShowingLoggedOutUser: delegate method to modify your app's UI for a logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    //self.profilePictureView.profileID = nil;
    //self.nameLabel.text = @"";
    //self.statusLabel.text= @"You're not logged in!";
}


@end