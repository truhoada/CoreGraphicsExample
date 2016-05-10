//
//  MainScreenTableVC.m
//  CoreGraphicsExamples
//
//  Created by hoangdangtrung on 5/5/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "MainScreenTableVC.h"
#import "DetailMainScreenVC.h"
#import "QuartzView.h"

#define ITEMS_KEY @"items"
#define GROUP_KEY @"titleGroup"
#define CELL_KEY @"titleCell"
#define CLASS_KEY @"viewClass"

@interface MainScreenTableVC ()
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) DetailMainScreenVC *detailMainVC;

@end

@implementation MainScreenTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Core Graphics";
    [self setupArrayData];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBarButton;
    
}

- (void)setupArrayData {
    if (!self.arrayData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        self.arrayData = [[NSArray alloc] initWithContentsOfFile:path];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.arrayData[section];
    NSArray *items = dict[ITEMS_KEY];
    
    return items.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = self.arrayData[section];
    
    return [dict valueForKey:GROUP_KEY];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  
    NSDictionary *dicSection = self.arrayData[indexPath.section];
    NSArray *items = [dicSection valueForKey: ITEMS_KEY];
    NSDictionary *dicCell = items[indexPath.row];
    cell.textLabel.text = [dicCell valueForKey:CELL_KEY];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dicSection = self.arrayData[indexPath.section];
    NSArray *items = [dicSection valueForKey: ITEMS_KEY];
    NSDictionary *dicCell = items[indexPath.row];
    NSString *nameViewClass = [dicCell valueForKey:CLASS_KEY];
    if (!self.detailMainVC) {
        self.detailMainVC = [DetailMainScreenVC new];
    }
    
    QuartzView *quartzView = [[NSClassFromString(nameViewClass) alloc] init];
    
    self.detailMainVC.view = quartzView;
    
    quartzView.frame = self.view.bounds;
    
    self.detailMainVC.title = [dicCell valueForKey:CELL_KEY];
    
    if ([quartzView respondsToSelector:@selector(customizeViewController:)]) {
        [quartzView customizeViewController:self.detailMainVC];
    }
    
    [self.navigationController pushViewController:self.detailMainVC animated:YES];
    
}

@end





















