//
//  Todo.m
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString *)title details:(NSString *)details priorityNumber:(int)priorityNumber {
    self = [super self];
    if (self) {
        _title = title;
        _details = details;
        _priorityNumber = priorityNumber;
        _isCompleted = NO;
    }
    return self;
}

@end
