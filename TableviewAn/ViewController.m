//
//  ViewController.m
//  TableviewAn
//
//  Created by 江湖 on 2019/5/29.
//  Copyright © 2019 江湖. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "TableViewCell3.h"

#import "HeaderView.h"
#import "SectionModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ViewController

NSString *const TABLEVIEWCELL1ID = @"TABLEVIEWCELL1ID";
NSString *const TABLEVIEWCELL2ID = @"TABLEVIEWCELL2ID";
NSString *const TABLEVIEWCELL3ID = @"TABLEVIEWCELL3ID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDatas];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 130;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell1" bundle:nil] forCellReuseIdentifier:TABLEVIEWCELL1ID];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell2" bundle:nil] forCellReuseIdentifier:TABLEVIEWCELL2ID];

    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell3" bundle:nil] forCellReuseIdentifier:TABLEVIEWCELL3ID];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initDatas{
    SectionModel *model1 = [[SectionModel alloc]init];
    SectionModel *model2 = [[SectionModel alloc]init];
    SectionModel *model3 = [[SectionModel alloc]init];
    SectionModel *model4 = [[SectionModel alloc]init];
    SectionModel *model5 = [[SectionModel alloc]init];
    model1.title = @"第一组";
    model2.title = @"第二组";
    model3.title = @"第三组";
    model4.title = @"第四组";
    model5.title = @"第五组";
    model1.cellType = SectionCellType2;
    model2.cellType = SectionCellType1;
    model3.cellType = SectionCellType3;
    model4.cellType = SectionCellType2;
    model5.cellType = SectionCellType1;

    [self.dataSource addObject:model1];
    [self.dataSource addObject:model2];
    [self.dataSource addObject:model3];
    [self.dataSource addObject:model4];
    [self.dataSource addObject:model5];
//    [self.tableView reloadData];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SectionModel *model = self.dataSource[indexPath.section];
//    NSLog(@"%ld",indexPath.section);
    if (model.cellType == SectionCellType1) {
        TableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEWCELL1ID];
        return cell;
    }else if (model.cellType == SectionCellType2){
        TableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEWCELL2ID];
        return cell;
    }else if (model.cellType == SectionCellType3){
        TableViewCell3 *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEWCELL3ID];
        return cell;
    }
    
    TableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEWCELL1ID];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SectionModel *model = self.dataSource[section];
    if (model.isAn) {
        return 1;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SectionModel * model = self.dataSource[section];
    HeaderView * headerView = [HeaderView initWithNibXib];
    headerView.model = model;
    headerView.section = section;
    headerView.delegate = self;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (void)selAnSection:(NSInteger)section {
    SectionModel * model = self.dataSource[section];
    model.isAn =! model.isAn;
//    [self.tableView reloadData];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end
