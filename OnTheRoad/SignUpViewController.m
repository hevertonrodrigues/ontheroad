//
//  SignUpViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/12/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "SignUpViewController.h"
#import "SearchViewController.h"
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
}



- (void) initComponents
{
    name = [[UITextField alloc] initWithFrame:CGRectMake( 40 , 120, 240, 40 )];
    name.backgroundColor = [UIColor whiteColor];
    name.delegate = self;
    name.placeholder = @"NOME";
    
    email = [[UITextField alloc] initWithFrame:CGRectMake( 40 , 220, 240, 40 )];
    email.backgroundColor = [UIColor whiteColor];
    email.delegate = self;
    email.placeholder = @"EMAIL";
    
    send = [[UIButton alloc] initWithFrame:CGRectMake( 40, 320, 240, 40 )];
    send.backgroundColor = [Util colorWithHexString:@"000000"];
    [send setTitle:@"ENTRAR" forState:UIControlStateNormal];
    [send addTarget:self action:@selector(loginWithNameAndEmail:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    FBLoginView *loginView = [[FBLoginView alloc] init];
    
 
    loginView.defaultAudience = FBSessionDefaultAudienceEveryone;
    //loginView.publishPermissions = @[@"publish_stream"];
    loginView.readPermissions = @[@"basic_info", @"email"];
    loginView.delegate = self;


    loginView.frame = CGRectMake( 40, 420, 240, 50);
    
    
    //if (!FBSession.activeSession.isOpen)
    //{
        [self.view addSubview:loginView];
    //}
    
    [self.view addSubview:name];
    [self.view addSubview:email];
    [self.view addSubview:send];
}


- (void)loginWithNameAndEmail:(UIButton*)sender
{
    if ( [name.text length] > 0 && [email.text length] > 0 )// || email.text != nil || [email.text isEqual:@""] == FALSE) )
    {
        NSDictionary *sendData = [[NSDictionary alloc] initWithObjectsAndKeys:name.text, @"name",
                                                                                email.text, @"email",
                                                                                @"manual", @"type",
                                                                                nil];
        [Util sendLogin:sendData];
        [self openMainScreen];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Preencha seu cadastro"
                                                               message: @"Os campos Nome Email são obrigatorios"
                                                               delegate:self
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
        [alert show];
    }
}


// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSDictionary *sendData = [[NSDictionary alloc] initWithObjectsAndKeys:user.name, @"name",
                                                                                user.id, @"profile_id",
                                                                                @"facebook", @"type",
                                                                                [result objectForKey:@"email"], @"email",
                                                                                nil];
        [Util sendLogin:sendData];
        [self openMainScreen];
//        NSLog(@"%@", user.name);
//        NSLog(@"%@", [result objectForKey:@"gender"]);
//        NSLog(@"%@", [result objectForKey:@"hometown"]);
//        NSLog(@"%@", [result objectForKey:@"birthday"]);
//        NSLog(@"%@", [result objectForKey:@"email"]);
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



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [name setFrame:CGRectMake( 40 , 40 , 240 , 40 ) ];
    [email setFrame:CGRectMake( 40 , 100 , 240 , 40 ) ];
    [send setFrame:CGRectMake( 100 , 160 , 120 , 40 ) ];
    //[UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(simulateDownBounceOne)];
    [UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Fade out the view right away
    [UIView animateWithDuration:0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                        [name setFrame:CGRectMake( 40 , 120, 240, 40 ) ];
                        [email setFrame:CGRectMake( 40 , 220, 240, 40 ) ];
                        [send setFrame:CGRectMake( 40, 320, 240, 40) ];
                     }
                     completion:^(BOOL finished){
                         // Wait one second and then fade in the view
                         [UIView animateWithDuration:0.3
                                               delay: 0.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                          }
                                          completion:nil];
                     }];
    [self.view endEditing:YES];
}


- (void)openMainScreen
{
    SearchViewController *search = [[SearchViewController alloc] init];
    [search setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:search animated:YES completion:nil];
}

@end