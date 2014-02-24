//
//  OCParentalGate.m
//  ParentalGate
//
//  Created by Martina Brazelton on 2/23/14.
//  Copyright (c) 2014 Obsessive-C Lab. All rights reserved.
//

#import "OCParentalGate.h"
#import "UIAlertView+Blocks.h"

@implementation OCParentalGate


+ (void)presentParentalGateWithBlock:(void(^)(BOOL success))block
{
    int int1 = [self generateRandomNumberBetweenMin:0 max:10];
    int int2 = [self generateRandomNumberBetweenMin:0 max:10];
    int correctAnswer = int1 + int2;
    
    NSString *question = [NSString stringWithFormat:@"%@ %d + %d", NSLocalizedString(@"What is", nil), int1, int2];
    
    NSString *message = [NSLocalizedString(@"Enter the correct answer to proceed: ", nil) stringByAppendingString:question];
    
    UIAlertView *alert = [UIAlertView.alloc initWithTitle:NSLocalizedString(@"Are you sure you're not a kid?", nil) message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"Go", nil), nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert showWithButtonTappedBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            UITextField *textField = [alertView textFieldAtIndex:0];
            BOOL success = (textField.text.intValue == correctAnswer);
            if (!success) {
                [self showWrongAnswerAlert];
            }
            
            if (block) {
                block(success);
            }
        }
    }];
}

+ (void)showWrongAnswerAlert
{
    UIAlertView *wrongAnswerAlert = [UIAlertView.alloc initWithTitle:NSLocalizedString(@"Oops", nil) message:NSLocalizedString(@"You entered the wrong answer", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    [wrongAnswerAlert show];
}

+ (int)generateRandomNumberBetweenMin:(int)min max:(int)max
{
    return ( (arc4random() % (max - min + 1)) + min );
}

@end
