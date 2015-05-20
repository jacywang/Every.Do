//
//  AddToDoViewController.h
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddToDoViewController;
@class Todo;

@protocol addToDoViewControllerDelegate <NSObject>

-(void)addToDoViewController:(AddToDoViewController *)addToDoViewController didSaveToDo:(Todo *)item;

@end

@interface AddToDoViewController : UIViewController

@property (strong, nonatomic) id<addToDoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *detailLabel;
@property (weak, nonatomic) IBOutlet UITextField *priorityLabel;

@end
