//
//  YJCustomMenu.h
//  YJCustomMenu
//
//  Created by hpyf on 2017/8/7.
//  Copyright © 2017年 Beijing Huapuyifang education technology co, LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJCustomMenuDelegate <NSObject>

- (void)YJCustomMenu:(UITableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YJCustomMenu : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) id<YJCustomMenuDelegate> delegate;
@property (nonatomic, strong) NSArray *arrData;
@property (nonatomic, strong) NSArray *arrImgName;
@property (nonatomic, assign) BOOL isSeem;

- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight;

@end
