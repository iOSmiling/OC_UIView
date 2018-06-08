//
//  HomeViewController.m
//  UIView
//
//  Created by 薛坤龙 on 2018/6/8.
//  Copyright © 2018年 CGJ. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry/Masonry.h>
#import "CornersViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSMutableArray *dataMarray;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	_dataMarray = [NSMutableArray array];
	[_dataMarray addObject:@"圆角"];
	
	[self.view addSubview:self.homeTableView];
	
	[_homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		
		make.edges.mas_equalTo(self.view);
		
	}];

	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _dataMarray.count;
	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellId = @"cellId";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
	
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	
	cell.textLabel.text = _dataMarray[indexPath.row];
	
	
	return cell;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (UITableView *)homeTableView
{
	if (!_homeTableView)
	{
		_homeTableView = [[UITableView alloc] init];
		_homeTableView.delegate = self;
		_homeTableView.dataSource = self;
	}
	return _homeTableView;
}


@end
