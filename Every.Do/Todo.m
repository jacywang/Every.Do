//
//  Todo.m
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "Todo.h"

#define kTitle @"Title"
#define kDetails @"Details"
#define kPriorityNumber @"PriorityNumber"
#define kIsCompleted @"IsCompleted"

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

-(id)initWithCoder:(NSCoder *)aDecoder {
    self.title = [aDecoder decodeObjectForKey:kTitle];
    self.details = [aDecoder decodeObjectForKey:kDetails];
    self.priorityNumber = [aDecoder decodeIntForKey:kPriorityNumber];
    self.isCompleted = [aDecoder decodeBoolForKey:kIsCompleted];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:kTitle];
    [aCoder encodeObject:self.details forKey:kDetails];
    [aCoder encodeInt:self.priorityNumber forKey:kPriorityNumber];
    [aCoder encodeBool:self.isCompleted forKey:kIsCompleted];
}

@end
