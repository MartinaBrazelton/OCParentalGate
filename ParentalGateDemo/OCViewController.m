//
//  OCViewController.m
//  ParentalGateDemo
//
//  Created by Martina Brazelton on 2/23/14.
//  Copyright (c) 2014 Obsessive-C Lab. All rights reserved.
//

#import "OCViewController.h"
#import "OCParentalGate.h"


@interface OCViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pressMeButton;

- (IBAction)pressMeButtonPressed:(UIButton *)sender;

@end


@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressMeButtonPressed:(UIButton *)sender
{
    [OCParentalGate presentParentalGateWithBlock:^(BOOL success) {
        if (success) {
            UIAlertView *alert = [UIAlertView.alloc initWithTitle:NSLocalizedString(@"You answered correctly", nil) message:NSLocalizedString(@"Access granted", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
            [alert show];
        }
    }];
}

@end
