//
//  HeaderView.h
//  TableviewAn
//
//  Created by 江湖 on 2019/5/29.
//  Copyright © 2019 江湖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HeaderViewDelegate <NSObject>

- (void)selAnSection:(NSInteger)section;

@end
@interface HeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (nonatomic,strong) SectionModel *model;
@property (nonatomic,assign) NSInteger section;
@property (nonatomic, weak) id < HeaderViewDelegate> delegate;
+ (instancetype)initWithNibXib;
@end

NS_ASSUME_NONNULL_END
