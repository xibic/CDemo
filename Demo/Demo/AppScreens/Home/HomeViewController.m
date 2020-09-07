//
//  HomeViewController.m
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCellView.h"
#import "HomeViewModel.h"

static NSString *CellIdentifier = @"HomeViewCell";


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *dataTableView;
@property (nonatomic, strong) NSMutableArray *tableDataArray;

@end

@implementation HomeViewController


#pragma mark - ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getPolicyEventData];
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

#pragma mark - Data
- (void)getPolicyEventData{

    [XIBActivityIndicator startActivity];
    
    [self.homeViewModel loadData:^(BOOL success) {
        [XIBActivityIndicator dismissActivity];
        [self addDataTableView];
    }];

}

#pragma mark - INitial View
- (void)setupInitialView{
    //No Views
}

#pragma mark - Table View
- (void)addDataTableView{
    
    // Register Custom cell to TableView
    [self.dataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    // Add TableView to Show - Department List
    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                      style:UITableViewStyleGrouped];
    [self.view addSubview:self.dataTableView];
    
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    
    self.dataTableView.backgroundColor = [UIColor clearColor];
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataTableView.rowHeight = 120;
    
}

#pragma mark - TableView
#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return [_homeViewModel numberOfSections];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) return @"Active Policies";
    return @"Vehicles";
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return [_homeViewModel numberOfRowsForSection:section];
}

//View For the Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath{
    
    // Declare the cell if nil
    HomeCellView * cell = [tableView dequeueReusableCellWithIdentifier:@"homeCellView"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"HomeCellView" bundle:nil] forCellReuseIdentifier:@"homeCellView"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"homeCellView"];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
//Display Cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(HomeCellView *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Update the cell...
    //Department *deptItem = (Department *)[self.tableDataArray objectAtIndex:indexPath.row];
    [cell updateWithData:[[_homeViewModel vehicleImage] lowercaseString]
                        :[_homeViewModel vehicleModel]
                        :[_homeViewModel vehicleColor]
                        :[_homeViewModel vehiclePrettyVrm]
                        :[_homeViewModel vehiclePrettyVrm]
                        :[_homeViewModel vehiclePrettyVrm]];
}

//Selected Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.appRouter didTapHomeViewCell:@""];
}



@end
