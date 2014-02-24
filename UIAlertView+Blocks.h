//
//  UIAlertView+Blocks.h
//  UIAlertViewBlocks
//
//  Created by Unicorn on 7/18/13.
//  Copyright (c) 2013 Martina Brazelton. All rights reserved.
//


typedef void (^ButtonTappedBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (Blocks)

- (void)showWithButtonTappedBlock:(ButtonTappedBlock)buttonTappedBlock;

@end
