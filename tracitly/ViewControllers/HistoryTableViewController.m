//
//  HistoryTableViewController.m
//  tracitly
//
//  Created by JAMES PARKER on 6/22/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "HistoryCell.h"
#import "Event.h"
#import "DataHelper.h"

@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController {
    NSMutableArray *_history;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated {
     _history = [DataHelper loadObjectsWithModelName:@"Event"];
    [self.tableView reloadData];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _history = [DataHelper loadObjectsWithModelName:@"Event"];
    
    
    

    
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

    // Return the number of rows in the section.
    return [_history count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell"];
    
    Event *historyItem = (_history)[indexPath.row];
    
    cell.lblActivity.text = historyItem.activity;
    cell.lblCategory.text = historyItem.category;
    
    if (historyItem.endTime == 0) {
        cell.lblDuration.text = [NSString stringWithFormat:@"%.1f m",([[NSDate date] timeIntervalSince1970] - historyItem.startTime)/60] ;
        cell.lblDuration.textColor = [UIColor redColor];
        
    }
    else {
        cell.lblDuration.text = [NSString stringWithFormat:@"%.1f m",(historyItem.endTime - historyItem.startTime)/ 60] ;
    }
    //cell.lblEstimate.text = [NSString stringWithFormat:@"%d m",historyItem.estimate];
    //double percent = (historyItem.endTime - historyItem.startTime)/historyItem.estimate * 1.0;
    //cell.lblPercent.text = [NSString stringWithFormat:@"%.0f%%",percent];
    
    //make date nice
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:historyItem.startTime];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [timeFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"hh:mm a" options:0 locale:[NSLocale currentLocale]]];
   
    cell.lblDate.text = [dateFormatter stringFromDate:date];
    cell.lblStartTime.text = [timeFormatter stringFromDate:date];
      
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
