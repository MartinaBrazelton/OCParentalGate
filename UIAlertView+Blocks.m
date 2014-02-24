//
//  UIAlertView+Blocks.m
//  UIAlertViewBlocks
//
//  Created by Unicorn on 7/18/13.
//  Copyright (c) 2013 Martina Brazelton. All rights reserved.
//


#import <objc/runtime.h>
#import "UIAlertView+Blocks.h"

@interface MBAlertViewDelegate : NSObject <UIAlertViewDelegate>

@property (copy) ButtonTappedBlock buttonTappedBlock;

@end

@implementation MBAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.buttonTappedBlock)
        self.buttonTappedBlock(alertView, buttonIndex);
}

@end

static const char kMBAlertViewDelegateKey;
@implementation UIAlertView (Blocks)

- (void)showWithButtonTappedBlock:(ButtonTappedBlock)buttonTappedBlock
{
    MBAlertViewDelegate *delegate = MBAlertViewDelegate.new;
    delegate.buttonTappedBlock = buttonTappedBlock;
    self.delegate = delegate;
    
    objc_setAssociatedObject(self, &kMBAlertViewDelegateKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self show];
}

@end
