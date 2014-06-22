//
//  MainViewController.m
//  tracitly
//
//  Created by JAMES PARKER on 6/17/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "MainViewController.h"
#import "SeedHelper.h"
#import "Activity.h"
#import "Event.h"
#import "DataHelper.h"

@interface MainViewController ()
{
    int secondsElapsed;
    int secondsEstimate;
    NSTimer *_timer;
    Event *currentlyRunningEvent;
}

@end

@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    _activities = [DataHelper loadObjectsWithModelName:@"Activity"];
    self.activities = _activities;
    [self.tvMain reloadData];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   // MainViewController *main = [tabBarController viewControllers][0];
    self.activities = _activities;
    
    self.lblPercentDone.text = @"";
    self.lblEstimate.text = @"";
    
    [self checkPreviousTimer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#//////////////////////////////////////////////////////
#pragma mark - Timer stuff
#//////////////////////////////////////////////////////

-(void)checkPreviousTimer {
    
    Event *event = (Event *)[DataHelper getLastObject:@"Event"];
    double now = [[NSDate date] timeIntervalSince1970];
    
    if (event != nil && event.endTime == 0) {
        self.lblTest.text = event.activity;
        self.lblEstimate.text = [NSString stringWithFormat:@"%d",event.estimate];
        secondsElapsed = now - event.startTime;
        secondsEstimate = event.estimate * 60;
        
        
        float percentDone = (float)secondsElapsed / (float)secondsEstimate / 100 ;

        self.lblPercentDone.text = [NSString stringWithFormat:@"%.0f%%",percentDone];
        currentlyRunningEvent = event;
        
        [self restartTimer];
    }
    
}

-(void)restartTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(updateElapsed)
                                            userInfo:nil
                                             repeats:YES];
    
}

- (void)startTimer:(Activity *)activity {
    
    if (_timer) {
        [self stopTimer];
    }
    self.lblElapsed.text = @"00:00:00";
    self.lblPercentDone.text = @"0%";
    secondsElapsed = 0;
    
    currentlyRunningEvent = [self createEventWithName:activity ];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(updateElapsed)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)stopTimer {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    [self updateEventWithEndTime];
    _timer = nil;
    
}

-(void) updateElapsed {
    int hours, minutes, seconds;
    
    secondsElapsed++;
    hours = secondsElapsed / 3600;
    minutes = (secondsElapsed % 3600) / 60;
    seconds = (secondsElapsed %3600) % 60;
    self.lblElapsed.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    float percentDone = (float)secondsElapsed / (float)secondsEstimate * 100;
    self.lblPercentDone.text = [NSString stringWithFormat:@"%.0f%%",percentDone];
}


#//////////////////////////////////////////////////////
#pragma mark - Data Manipulation
#//////////////////////////////////////////////////////


-(Event *)createEventWithName:(Activity *)activity {
    
    Event *event = [[Event alloc] init];
    event.activity = activity.title;
    event.startTime =[[NSDate date] timeIntervalSince1970];
    event.category = @"Maint";
    event.estimate = activity.estimate;
    
    //Get persisted list of objects
    Event *newObj = (Event *)[DataHelper createObject:event];
    
    
    //add new event - get back index number
    
    //return reference to the object in the array
    return newObj;
    
}

-(BOOL)updateEventWithEndTime {
    
    //get the right event
    
    if (currentlyRunningEvent != nil) {
        currentlyRunningEvent.endTime = [[NSDate date] timeIntervalSince1970];
        [DataHelper updateLatestObject:currentlyRunningEvent];
    }
    
    return YES;
}


#//////////////////////////////////////////////////////
#pragma mark - Table handlers
#//////////////////////////////////////////////////////


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_activities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ActivityCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Activity *activity =[_activities objectAtIndex:indexPath.row];
    cell.textLabel.text = activity.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Activity *activity = self.activities[indexPath.row];
    
    [self stopTimer];
    secondsElapsed = 0;
    secondsEstimate = activity.estimate * 60;
    self.lblEstimate.text = [NSString stringWithFormat:@"%d m",activity.estimate];
    self.lblTest.text = activity.title;
    [self startTimer:activity];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (void)startTimer {
//    if (!_timer) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
//                                                  target:self
//                                                selector:@selector(updateElapsed)
//                                                userInfo:nil
//                                                 repeats:YES];
//    }
//}





@end
