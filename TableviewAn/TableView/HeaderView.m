//
//  HeaderView.m
//  TableviewAn
//
//  Created by 江湖 on 2019/5/29.
//  Copyright © 2019 江湖. All rights reserved.
//

#import "HeaderView.h"
@interface HeaderView()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;

@end

@implementation HeaderView

+ (instancetype)initWithNibXib{
   HeaderView *headerView = [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil].firstObject;
    return headerView;
}

- (void)setModel:(SectionModel *)model{
    _model = model;
    self.titleLab.text = model.title;

    if (model.isAn) {
        self.leftBtn.selected = YES;
    }else{
        self.leftBtn.selected = NO;
    }
}
- (IBAction)headerClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(selAnSection:)]) {
        [self.delegate selAnSection:self.section];
    }
}

- (IBAction)leftBtn:(UIButton *)sender {
    sender.selected =! sender.selected;
}

@end
