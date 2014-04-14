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
#import "SelectViewController.h"
#import "AddViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    screenW = self.view.frame.size.width;
    screenH = self.view.frame.size.height;
    
    places = [Util getPlacesByCategory:[category lowercaseString]];
   
    
    //places = [NSArray arrayWithObjects:@"primeiro", @"segundo", nil];
    self.view.backgroundColor = [Util colorWithHexString:@"FFDC00"];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake( 130, 30, 100, 40 )];
    title.textColor = [Util colorWithHexString:@"563f03"];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:28.0];
    title.text = category;
    
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake( 10, 25, 50, 50)];
    UIImageView *backBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    backBG.image = [UIImage imageNamed:@"back"];
    [back addSubview:backBG];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *add = [[UIButton alloc] initWithFrame:CGRectMake( screenW - 60, 25, 50, 50)];
    UIImageView *addBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    addBG.image = [UIImage imageNamed:@"plus"];
    [add addSubview:addBG];
    [add addTarget:self action:@selector(addExp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:title];
    [self.view addSubview:back];
    [self.view addSubview:add];
    
    [self initTableView];
    
    
    //NSLog(@"CATEGORY: %@", category);
    
    //NSLog(@"-------------------------------- %@", [Util getPlacesByCategory:category] );
    
}


- (void)openExp:(UIButton*)_exp
{
    expView = [[UIView alloc] initWithFrame:CGRectMake( 10, 220, 300, 200 )];
    expView.layer.borderColor = [[Util colorWithHexString:@"563f03"] CGColor];
    expView.layer.borderWidth = 1;
    expView.layer.cornerRadius = 10;
    expView.backgroundColor = [UIColor whiteColor];
    
    UITextView *txtExp = [[UITextView alloc] initWithFrame:CGRectMake( 20, 20, 240, 180 )];
    txtExp.text = [[places objectAtIndex:_exp.tag] objectForKey:@"comment"];
    txtExp.textColor = [Util colorWithHexString:@"FFDC00"];
    txtExp.editable = NO;
    
    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake( 280, 5, 10, 10)];
    [close setTitle:@"x" forState:UIControlStateNormal];
    [close setTitleColor:[Util colorWithHexString:@"563f03"] forState:UIControlStateNormal];
    
    [expView addSubview:close];
    [expView addSubview:txtExp];
    
    [self.view addSubview:expView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
        expView.frame = CGRectMake( 10, 1220, 300, 200);
    [UIView commitAnimations];
}

- (void)initTableView
{
    resultsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, screenW, screenH - 80)];
    resultsTableView.delegate = self;
    resultsTableView.dataSource = self;
    resultsTableView.rowHeight = 140;
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
    
    UILabel *itemTitle = [[UILabel alloc] initWithFrame:CGRectMake( 20, 10, 280, 20 )];
    itemTitle.textColor = [Util colorWithHexString:@"563f03"];
    itemTitle.text = [[places objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    UIImageView *hearth = [[UIImageView alloc] initWithFrame:CGRectMake( 20, 40, 20, 20)];
    hearth.image = [UIImage imageNamed:@"hearth"];
    
    UILabel *numberOfLikes = [[UILabel alloc] initWithFrame:CGRectMake( 50, 40, 220, 20 )];
    numberOfLikes.textColor = [Util colorWithHexString:@"563f03"];
    numberOfLikes.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14];
    numberOfLikes.text = [NSString stringWithFormat:@"%@ love it", [[places objectAtIndex:indexPath.row] objectForKey:@"grade"]];
    
    UIImageView *pinMap = [[UIImageView alloc] initWithFrame:CGRectMake( 20, 70, 20, 25)];
    pinMap.image = [UIImage imageNamed:@"pin_map"];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake( 50, 70, 220, 20 )];
    address.textColor = [Util colorWithHexString:@"563f03"];
    address.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:14];
    address.text = [[places objectAtIndex:indexPath.row] objectForKey:@"local"];
    
    UIButton *seeExp = [[UIButton alloc] initWithFrame:CGRectMake( 20, 110, 100, 20 )];
    UIImageView *seeExpBG = [[UIImageView alloc] initWithFrame:CGRectMake( 0, 0, 100, 20)];
    seeExpBG.tag = indexPath.item;
    seeExpBG.image = [UIImage imageNamed:@"see_exp"];
    [seeExp addTarget:self action:@selector(openExp:) forControlEvents:UIControlEventTouchUpInside];
    [seeExp addSubview:seeExpBG];
    
    UIImageView *picture = [[UIImageView alloc] initWithFrame:CGRectMake( 180, 30, 120, 80 )];
    picture.image = [UIImage imageNamed:@"image"];
    
    [cell addSubview:itemTitle];
    [cell addSubview:hearth];
    [cell addSubview:numberOfLikes];
    [cell addSubview:pinMap];
    [cell addSubview:address];
    [cell addSubview:seeExp];
    [cell addSubview:picture];
   
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
//    [self performSelector:@selector(openExp:) withObject:indexPath afterDelay:0.1];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)setCategory:(NSString*)_category
{
    category = _category;
}

- (void)addExp:(UIButton*)_exp
{
    AddViewController *add = [[AddViewController alloc] init];
    [add setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:add animated:YES completion:nil];
}

- (void)openDetails
{
    PlaceDetailViewController *detail = [[PlaceDetailViewController alloc] init];
    [detail setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:detail animated:YES completion:nil];
}

- (void)back:(UIButton*)sender
{
    SelectViewController *select = [[SelectViewController alloc] init];
    [select setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:select animated:YES completion:nil];
}

@end
