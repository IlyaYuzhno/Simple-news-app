//
//  ViewController.m
//  l3_IlyaD
//
//  Created by Ilya Doroshkevitch on 25.12.2020.
// api key 92cabf74797a4bce9f5fc71de9271e1f

#import "NewsViewController.h"
#import "Interactor.h"

@interface NewsViewController ()

@property (nonatomic, strong) NSArray *news;

@end

@implementation NewsViewController


- (void)viewWillAppear:(BOOL)animated{
    // MARK: Get network request via Interactor
    Interactor *interactor = [[Interactor alloc] init];
    [interactor newsRequest:^(NSArray *news) {
        self->_news = news;
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NEWS";
    self.view.backgroundColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.news = [_news objectAtIndex:indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}


// MARK: GO TO FULL VIEW VIA ROUTER
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [Router goNext:_news indexPath:indexPath controller:self];
    
}

@end
