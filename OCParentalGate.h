//
//  OCParentalGate.h
//  ParentalGate
//
//  Created by Martina Brazelton on 2/23/14.
//  Copyright (c) 2014 Obsessive-C Lab. All rights reserved.
//


@interface OCParentalGate : NSObject

+ (void)presentParentalGateWithBlock:(void(^)(BOOL success))block;

@end
