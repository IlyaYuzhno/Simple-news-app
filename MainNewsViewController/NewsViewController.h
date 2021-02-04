//
//  ViewController.h
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
//

#import <UIKit/UIKit.h>
#import "Interactor.h"
#import "Cell.h"
#import "Router.h"

#define CELL_HEIGHT 140.0


@interface NewsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonnull) UITableView *tableView;

@end

