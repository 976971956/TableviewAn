//
//  SectionModel.h
//  TableviewAn
//
//  Created by 江湖 on 2019/5/29.
//  Copyright © 2019 江湖. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SectionCellType) {
    SectionCellType1,
    SectionCellType2,
    SectionCellType3,
};
@interface SectionModel : NSObject

@property (nonatomic ,assign) BOOL isAn;//是否展开
@property (nonatomic ,copy) NSString *title;//标题
@property (nonatomic ,assign) SectionCellType cellType;//cell的类型

@end

NS_ASSUME_NONNULL_END
