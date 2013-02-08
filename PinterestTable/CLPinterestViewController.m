//
//  CLPinterestViewController.m
//  PinterestTable
//
//  Created by Darcy on 2/8/13.
//  Copyright (c) 2013 Darcy Liu. All rights reserved.
//

#import "CLPinterestViewController.h"

@interface CLPinterestViewController (){
    NSMutableArray *tables;//for UITableView
    NSInteger count;
}

@end

@implementation CLPinterestViewController

- (id)init
{
    self = [super init];
    if (self) {
        count = 4;
        tables = [[NSMutableArray alloc] initWithCapacity:count];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat x = self.view.frame.size.width/count;
    int i;
	for (i=0; i<count; i++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(i*x, 0, x, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:tableView];
        [tables addObject:tableView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PinterestCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int i;
	for (i=0; i<count; i++) {
        if (tables[i]==tableView) {
            return tableView.rowHeight + indexPath.row%3*50+i*50;
        }
    }
    return tableView.rowHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int i;
	for (i=0; i<count; i++) {
        UITableView *tableView = (UITableView *)tables[i];
        if (tableView!=scrollView) {
            [tableView setContentOffset:scrollView.contentOffset];
        }
    }
}
@end
