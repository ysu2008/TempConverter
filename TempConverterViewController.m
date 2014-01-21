//
//  TempConverterViewController.m
//  TempConverter
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitValue;
@property (weak, nonatomic) IBOutlet UITextField *celsiusValue;
@property (weak, nonatomic) UITextField *lastEditedField;
- (IBAction)onTap:(id)sender;
- (IBAction)didTapConvertButton:(id)sender;
- (IBAction)celsiusEdited:(id)sender;
- (IBAction)fahrenheitEdited:(id)sender;

@end

@implementation TempConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)didTapConvertButton:(id)sender {
    if (self.lastEditedField && self.lastEditedField.text){
        
        //text exists
        if ([self.lastEditedField isEqual:self.celsiusValue]){
            //convert celsius to fahrenheit
            float celsius = [self.celsiusValue.text floatValue];
            float fahrenheit = celsius * 1.8 + 32;
            self.fahrenheitValue.text = [NSString stringWithFormat:@"%0.1f", fahrenheit];
        }
        else {
            //convert fahrenheit to celsius
            float fahrenheit = [self.fahrenheitValue.text floatValue];
            float celsius = (fahrenheit - 32)/1.8;
            self.celsiusValue.text = [NSString stringWithFormat:@"%0.1f", celsius];
        }
    }
}

- (IBAction)celsiusEdited:(id)sender {
    self.lastEditedField = self.celsiusValue;
}

- (IBAction)fahrenheitEdited:(id)sender {
    self.lastEditedField = self.fahrenheitValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
