//
//  ActivityViewControllerTableViewController.m
//  tracitly
//
//  Created by JAMES PARKER on 6/16/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "Activity.h"
#import "ActivityCell.h"
#import "DataHelper.h"

@interface ActivityTableViewController ()

@end

@implementation ActivityTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.activities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell"];
    
    Activity *activity = (self.activities)[indexPath.row];
    
    cell.titleLabel.text = activity.title;
    cell.catLabel.text = activity.category;
    cell.estLabel.text = [NSString stringWithFormat:@"%d m",activity.estimate];
   
    
      //silliness
    UIColor *glowColor = [UIColor blueColor];
    cell.estLabel.backgroundColor = glowColor;
    cell.estLabel.layer.cornerRadius = 4;
    cell.estLabel.layer.shadowColor = [glowColor CGColor];
    cell.estLabel.layer.shadowRadius = 3.0f;
    cell.estLabel.layer.shadowOpacity = .8;
    cell.estLabel.layer.shadowOffset = CGSizeZero;
    cell.estLabel.layer.masksToBounds = NO;
    
    
    return cell;
}

- (void)activityDetailsViewControllerDidCancel: (ActivityDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)activityDetailsViewController: (ActivityDetailsViewController *)controller didAddActivity:(Activity *)activity
{
    [self.activities addObject:activity];
    [DataHelper SaveObjects:self.activities];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: ([self.activities count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)activityDetailsViewController: (ActivityDetailsViewController *)controller didEditActivity:(Activity *)activity
{
    [DataHelper SaveObjects:self.activities];
    NSUInteger index = [self.activities indexOfObject:activity];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddActivity"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ActivityDetailsViewController *activityDetailsViewController = [navigationController viewControllers][0];
        activityDetailsViewController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"EditActivity"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ActivityDetailsViewController *activityDetailsViewController = [navigationController viewControllers][0];
        activityDetailsViewController.delegate = self;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Activity *activity = self.activities[indexPath.row];
        activityDetailsViewController.activityToEdit = activity;
        
    }
}


@end
