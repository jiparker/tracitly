//
//  SettingViewController.m
//  tracitly
//
//  Created by JAMES PARKER on 6/22/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "SettingViewController.h"
#import "SeedHelper.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)btnLoad:(id)sender {
    [SeedHelper seedActivities];
    
}

- (IBAction)btnClear:(id)sender {
    [SeedHelper clearActivities];
}
@end
