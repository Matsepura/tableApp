//
//  SmViewController.h
//  tableApp
//
//  Created by Semen Matsepura on 02.01.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
