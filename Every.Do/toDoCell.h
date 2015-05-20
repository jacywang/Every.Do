//
//  toDoCell.h
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailsLabel;
@property (nonatomic, weak) IBOutlet UILabel *priorityNumberLabel;

@end
