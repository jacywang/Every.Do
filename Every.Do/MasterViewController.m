//
//  MasterViewController.m
//  Every.Do
//
//  Created by JIAN WANG on 5/20/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "ToDoCell.h"
#import "AddToDoViewController.h"

@interface MasterViewController ()  <addToDoViewControllerDelegate>

@property NSMutableArray *toDoList;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Todo *toDo1 = [[Todo alloc] initWithTitle:@"To do 1" details:@"You need to complete this task asap today! We are looking forward to it!" priorityNumber:1];
    Todo *toDo2 = [[Todo alloc] initWithTitle:@"To do 2" details:@"You need to complete this task asap today! We are looking forward to it!" priorityNumber:3];
    Todo *toDo3 = [[Todo alloc] initWithTitle:@"To do 3" details:@"You need to complete this task asap today! We are looking forward to it!" priorityNumber:2];
    Todo *toDo4 = [[Todo alloc] initWithTitle:@"To do 4" details:@"You need to complete this task asap today! We are looking forward to it!" priorityNumber:3];
    Todo *toDo5 = [[Todo alloc] initWithTitle:@"To do 5" details:@"You need to complete this task asap today! We are looking forward to it!" priorityNumber:1];
    toDo5.isCompleted = YES;
    
    self.toDoList = [[NSMutableArray alloc] initWithArray:@[toDo1, toDo2, toDo3, toDo4, toDo5]];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    [self.tableView addGestureRecognizer:swipeGesture];
}

-(IBAction)swipeCell:(UISwipeGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
    [self.toDoList[indexPath.row] setIsCompleted:YES];
//    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addToDoViewController:(AddToDoViewController *)addToDoViewController didSaveToDo:(Todo *)item {
    [self.toDoList addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.toDoList.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *item = self.toDoList[indexPath.row];
        
        [[segue destinationViewController] setDetailItem:item];
    } else if ([segue.identifier isEqualToString:@"addToDo"]) {
        AddToDoViewController *addToDoViewController = segue.destinationViewController;
        addToDoViewController.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *item = self.toDoList[indexPath.row];
    NSString *pnString = [NSString stringWithFormat:@"%d", item.priorityNumber];
    
    if (item.isCompleted) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlinePatternSolid | NSUnderlineStyleSingle]};
        NSAttributedString *titleAttributedString = [[NSAttributedString alloc] initWithString:item.title attributes:attributes];
        NSAttributedString *detailsAttributedString = [[NSAttributedString alloc] initWithString:item.details attributes:attributes];
        NSAttributedString *pnAttributedString = [[NSAttributedString alloc] initWithString:pnString attributes:attributes];
        
        cell.titleLabel.attributedText = titleAttributedString;
        cell.detailsLabel.attributedText = detailsAttributedString;
        cell.priorityNumberLabel.attributedText = pnAttributedString;
    } else {
        cell.titleLabel.text = item.title;
        cell.detailsLabel.text = item.details;
        cell.priorityNumberLabel.text = pnString;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
