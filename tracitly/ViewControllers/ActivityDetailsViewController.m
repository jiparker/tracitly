//
//  ActivityDetailsViewController.m
//  tracitly
//
//  Created by JAMES PARKER on 6/17/14.
//  Copyright (c) 2014 JP. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "Activity.h"


@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController {
    NSString *_category;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init PlayerDetailsViewController");
        _category = @"Maintenance";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.activityToEdit != nil) {
        self.title = @"Edit Activity";
        self.titleTextField.text = self.activityToEdit.title;
        self.estTextField.text = [NSString stringWithFormat: @"%d",self.activityToEdit.estimate];
        _category = self.activityToEdit.category;
        
    }
    
    
    self.detailLabel.text = _category;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate activityDetailsViewControllerDidCancel:self]; }
- (IBAction)done:(id)sender {
    
    if (self.activityToEdit != nil) {
        self.activityToEdit.title = self.titleTextField.text;
        self.activityToEdit.category = _category;
        self.activityToEdit.estimate = [self.estTextField.text intValue];
        [self.delegate activityDetailsViewController:self didEditActivity:self.activityToEdit];        
    }
    else {
        Activity *activity = [[Activity alloc] init];
        activity.title = self.titleTextField.text;
        activity.category = _category;
        activity.estimate = [self.estTextField.text intValue];
        
        [self.delegate activityDetailsViewController:self didAddActivity:activity];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.titleTextField becomeFirstResponder]; }
    else if (indexPath.section == 2) {
        [self.estTextField becomeFirstResponder];
    }
}
- (void)categoryPickerViewController: (CategoryPickerViewController *)controller
                   didSelectCategory:(NSString *)category {
    _category = category;
    self.detailLabel.text = _category;
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickCategory"]) {
        CategoryPickerViewController *categoryPickerViewController = segue.destinationViewController;
        categoryPickerViewController.delegate = self;
        categoryPickerViewController.category = _category; }
   }


@end
