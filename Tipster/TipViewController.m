//
//  TipViewController.m
//  Tipster
//
//  Created by Evelyn Hasama on 1/23/22.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentagesControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UIView *wordLabelsContainerView;


@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger colorIndex = [defaults integerForKey:@"color"];
    NSInteger fontSizeIndex = [defaults integerForKey:@"fontSize"];
    
    UIColor *color;
    if (colorIndex == 0){
        color = UIColor.systemRedColor;
    } else if (colorIndex == 1){
        color = UIColor.systemGreenColor;
    } else {
        color = UIColor.systemBlueColor;
    }
    [self.billField setTextColor:color];
    
    int fontSize;
    if (fontSizeIndex == 0){
        fontSize = 40;
    } else if (fontSizeIndex == 1){
        fontSize = 60;
    } else {
        fontSize = 80;
    }
    [self.billField setFont:[UIFont systemFontOfSize:fontSize]];
}

- (IBAction)onTap:(id)sender {
    NSLog(@"on tap");
    
    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    if (self.billField.text.length == 0){
        [self hideLabels];
    }
    else if (self.labelsContainerView.alpha == 0) {
        [self showLabels];
    }
    NSLog(@"update labels");
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentagesControl.selectedSegmentIndex];
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.2 animations:^{
    
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y += 200;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
        
        CGRect wordLabelsFrame = self.wordLabelsContainerView.frame;
        wordLabelsFrame.origin.y += 200;
        
        self.wordLabelsContainerView.frame = wordLabelsFrame;
        
        self.wordLabelsContainerView.alpha = 0;
    } ];
}

-(void)showLabels {
    [UIView animateWithDuration:0.2 animations:^{
    
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y -= 200;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
        
        CGRect wordlabelsFrame = self.wordLabelsContainerView.frame;
        wordlabelsFrame.origin.y -= 200;
        
        self.wordLabelsContainerView.frame = wordlabelsFrame;
        
        self.wordLabelsContainerView.alpha = 1;
    } ];
    
    
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
