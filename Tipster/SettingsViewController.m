//
//  SettingsViewController.m
//  Tipster
//
//  Created by Evelyn Hasama on 1/23/22.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fontSizeSegmentedControl;

@end

@implementation SettingsViewController

NSUserDefaults *defaults;

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    defaults = [NSUserDefaults standardUserDefaults];
    NSInteger colorIndex = [defaults integerForKey:@"color"];
    NSInteger fontSizeIndex = [defaults integerForKey:@"fontSize"];
    [self.colorSegmentedControl setSelectedSegmentIndex:colorIndex];
    [self.fontSizeSegmentedControl setSelectedSegmentIndex:fontSizeIndex];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [defaults setInteger:self.fontSizeSegmentedControl.selectedSegmentIndex forKey:@"fontSize"];
    [defaults setInteger:self.colorSegmentedControl.selectedSegmentIndex forKey:@"color"];
    [defaults synchronize];
    // Do any additional setup after loading the view.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
