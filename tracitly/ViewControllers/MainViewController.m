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

-(void)checkPreviousTimer {
    
    Event *event = (Event *)[DataHelper getLastObject:@"Event"];
    double now = [[NSDate date] timeIntervalSince1970];
    
    if (event.endTime == 0) {
        currentlyRunningEvent = event;
        secondsElapsed = now - event.startTime;
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

- (void)startTimer:(NSString *)name {
    
    if (_timer) {
        [self stopTimer];
    }
    self.lblElapsed.text = @"00:00:00";
    secondsElapsed = 0;
    
    currentlyRunningEvent = [self createEventWithName:name ];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(updateElapsed)
                                            userInfo:nil
                                             repeats:YES];
}

-(Event *)createEventWithName:(NSString *)eventActivity {
    
    Event *event = [[Event alloc] init];
    event.activity = eventActivity;
    event.startTime =[[NSDate date] timeIntervalSince1970];
    event.category = @"Maint";
    
    //Get persisted list of objects
    Event *newObj = (Event *)[DataHelper createObject:event];
    
    
    //add new event - get back index number
    
    //return reference to the object in the array
    return newObj;
    
}

-(BOOL)updateEventWithEndTime {
    
    //get the right event
    
    currentlyRunningEvent.endTime = [[NSDate date] timeIntervalSince1970];
    [DataHelper updateLatestObject:currentlyRunningEvent];
    
    //set end time
    
    //save and persist
    
    return YES;
}


- (void)stopTimer {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    [self updateEventWithEndTime];
    _timer = nil;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lblPercentDone.text = @"";
    self.lblEstimate.text = @"";
    
    //_activities = [ActivityHelper getActivities];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    [self startTimer];
    
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

- (void)startTimer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(updateElapsed)
                                                userInfo:nil
                                                 repeats:YES];
    }
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




@end
