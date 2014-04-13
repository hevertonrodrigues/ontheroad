//
//  ResultsViewController.m
//  OnTheRoad
//
//  Created by Heverton Rodrigues on 4/13/14.
//  Copyright (c) 2014 hackathon. All rights reserved.
//

#import "ResultsViewController.h"
#import "Util.h"
#import "PlaceDetailViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    places = [Util getPlacesByCategory:category];
    [self initTableView];
    
    
    //NSLog(@"CATEGORY: %@", category);
    
    //NSLog(@"-------------------------------- %@", [Util getPlacesByCategory:category] );
    
}

- (void)initTableView
{
    resultsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    resultsTableView.delegate = self;
    resultsTableView.dataSource = self;
    [resultsTableView reloadData];
    
    [self.view addSubview:resultsTableView];
}

#pragma mark TableView Delegates


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell Cache ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    //Content *c = [contents objectAtIndex:indexPath.row];
    
    NSString *p = [places objectAtIndex:indexPath.row];

    cell.textLabel.text = p;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:16];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 2;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    float position = [tableView rectForRowAtIndexPath:indexPath].origin.y + [tableView rectForRowAtIndexPath:indexPath].size.height - 13;
//    
//    NSString *path=[[NSBundle mainBundle]pathForResource:@"guines_loader" ofType:@"gif"];
//    NSURL *url=[[NSURL alloc] initFileURLWithPath:path];
//    UIImage* mygif = [UIImage animatedImageWithAnimatedGIFURL:url];
//    nextLoaderGif = [[UIImageView alloc] initWithFrame:CGRectMake( 270 , position , 50, 13 )];
//    nextLoaderGif.image = mygif;
//    nextLoaderGif.alpha = 1;
//    [self.view addSubview:nextLoaderGif];
//
    [self performSelector:@selector(openDetails) withObject:indexPath afterDelay:0.1];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)setCategory:(NSString*)_category
{
    category = _category;
}


- (void)openDetails
{
    PlaceDetailViewController *detail = [[PlaceDetailViewController alloc] init];
    [detail setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:detail animated:YES completion:nil];
}

@end
