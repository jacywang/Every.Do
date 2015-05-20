//
//  Todo.h
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic, assign) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString *)title details:(NSString *)details priorityNumber:(int)priorityNumber;

@end
