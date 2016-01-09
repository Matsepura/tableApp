//
//  SMTableViewController.m
//  tableApp
//
//  Created by Semen Matsepura on 02.01.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

#import "SMTableViewController.h"

@interface SMTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (assign, nonatomic) CGPoint lastContentOffset;

@end

@implementation SMTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentOffset = CGPointMake(0.0, 444.0);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint currentOffset = scrollView.contentOffset;
    if (currentOffset.y > self.lastContentOffset.y)
    {
        // Downward
        NSLog(@"down");
        //self.tableView.contentOffset = CGPointMake(0.0, 44.0);
        // get the table and search bar bounds
        CGRect tableBounds = self.tableView.bounds;
        CGRect searchBarFrame = self.searchBar.frame;
        
        // make sure the search bar stays at the table's original x and y as the content moves
        self.searchBar.frame = CGRectMake(tableBounds.origin.x,
                                          - tableBounds.origin.y + 66,
                                          searchBarFrame.size.width,
                                          searchBarFrame.size.height
                                          );

    }
    else
    {
        // Upward
        NSLog(@"up");
        CGRect tableBounds = self.tableView.bounds;
        CGRect searchBarFrame = self.searchBar.frame;
        
        // make sure the search bar stays at the table's original x and y as the content moves
        self.searchBar.frame = CGRectMake(tableBounds.origin.x,
                                          - tableBounds.origin.y + 66,
                                          searchBarFrame.size.width,
                                          searchBarFrame.size.height
                                          );

    }
    self.lastContentOffset = currentOffset;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 47;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *cellIdentifier = @"simon";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
        NSLog(@"create");
    } else {
        NSLog(@"resued");
    }
    
    // Configure the cell...
    [cell setBackgroundColor:[self randomColor]];
//    cell.textLabel.text = [NSString stringWithFormat:@"Row: %ld", (long)indexPath.row];
//    if (indexPath.row % 2 == 0) {
//        [cell setBackgroundColor:[UIColor whiteColor]];
//    }
//    else {
//        [cell setBackgroundColor:[UIColor lightGrayColor]];
//    }
    
    return cell;
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    NSLog(@"%@", color);
    return color;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
