//
//  AddToDoViewController.m
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "AddToDoViewController.h"
#import "Todo.h"

@interface AddToDoViewController ()

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.titleLabel.text = [userDefaults objectForKey:@"Title"];
    self.detailLabel.text = [userDefaults objectForKey:@"Details"];
    self.priorityLabel.text = [NSString stringWithFormat:@"%ld",(long)[userDefaults integerForKey:@"PriorityNumber"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(UIButton *)sender {
    Todo *item = [[Todo alloc] initWithTitle:self.titleLabel.text details:self.detailLabel.text priorityNumber:(int)[self.priorityLabel.text integerValue]];
    
    [self.delegate addToDoViewController:self didSaveToDo:item];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
