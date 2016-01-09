//
//  SmViewController.m
//  tableApp
//
//  Created by Semen Matsepura on 02.01.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) CGFloat previousScrollViewYOffset;
@property (nonatomic) BOOL up;

@end

@implementation SMViewController

#pragma mark - setup
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scrollViewDidScroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = self.searchBar.frame;
    CGFloat size = frame.size.height - 21;
    CGFloat scrollOffset = scrollView.contentOffset.y;
    CGFloat scrollDiff = scrollOffset - self.previousScrollViewYOffset;
    CGFloat scrollHeight = scrollView.frame.size.height;
    CGFloat scrollContentSizeHeight = scrollView.contentSize.height + scrollView.contentInset.bottom;
    
    if (scrollOffset - 64 <= -scrollView.contentInset.top) {
        
        frame.origin.y = 64;
        self.up = YES;
        
        [UIView animateWithDuration:0.3 animations:^{

                [self.searchBar setFrame:frame];
            
        }];

    } else if ((scrollOffset + scrollHeight) >= scrollContentSizeHeight) {
        
        frame.origin.y = -size;
        
    } else {
        
        frame.origin.y = MIN(20, MAX(-size, frame.origin.y - scrollDiff));
        if (self.up == YES) {
            frame.origin.y = 20;
            self.up = NO;
            
            [UIView animateWithDuration:0.3 animations:^{
                
                [self.searchBar setFrame:frame];
                
            }];
        }

    }
    
    [self.searchBar setFrame:frame];

    self.previousScrollViewYOffset = scrollOffset;
}

#pragma mark - Table view data source

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
        //        NSLog(@"create");
    } else {
        //        NSLog(@"resued");
    }
    
    // Configure the cell...
    [cell setBackgroundColor:[self randomColor]];
    
    return cell;
}

#pragma mark - make random color

- (UIColor *)randomColor
{
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //    NSLog(@"%@", color);
    return color;
}

@end
