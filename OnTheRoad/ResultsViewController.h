//
//  ResultsViewController.h
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *category;
    NSArray *places;
    
    int screenW;
    int screenH;
    
    UITableView *resultsTableView;
    UIView *expView;
}


- (void)setCategory:(NSString*)_category;

@end
