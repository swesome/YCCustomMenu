//
//  YJCustomMenu.m
//  YJCustomMenu
//
//  Created by hpyf on 2017/8/7.
//  Copyright © 2017年 Beijing Huapuyifang education technology co, LTD. All rights reserved.
//

#import "YJCustomMenu.h"

#define TopToView 10.0f
#define LeftToView 10.0f
#define CellLineEdgeInsets UIEdgeInsetsMake(0, 10, 0, 10)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface YJCustomMenu()
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat rowHeight;
@end

@implementation YJCustomMenu

- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        if (rowHeight <= 0) {
            rowHeight = 44;
        }
        self.backgroundColor = [UIColor clearColor];
        self.origin = origin;
        self.rowHeight = rowHeight;
        self.arrData = [dataArr copy];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x + LeftToView, origin.y + TopToView, width, rowHeight * dataArr.count) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        _tableView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        _tableView.layer.cornerRadius = 2;
        _tableView.bounces = NO;
        _tableView.separatorColor = [UIColor colorWithWhite:0.3 alpha:1];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"JHCustomMenu"];
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            
            [self.tableView setSeparatorInset:CellLineEdgeInsets];
            
        }
        
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            
            [self.tableView setLayoutMargins:CellLineEdgeInsets];
            
        }
        
    }
    return self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JHCustomMenu"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = self.arrData[indexPath.row];
    if (self.arrImgName.count > indexPath.row) {
        cell.imageView.image = [UIImage imageNamed:self.arrImgName[indexPath.row]];
        //        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(YJCustomMenu:didSelectedRowAtIndexPath:)]){
        [self.delegate YJCustomMenu:tableView didSelectedRowAtIndexPath:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.isSeem = NO;
    [self removeFromSuperview];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:CellLineEdgeInsets];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:CellLineEdgeInsets];
        
    }
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}

- (void)drawRect:(CGRect)rect

{
    
    
    //    [colors[serie] setFill];
    
    //拿到当前视图准备好的画板
    
    CGContextRef
    context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    
    CGContextMoveToPoint(context,
                         LeftToView * 2.5, TopToView * 0.5);//设置起点
    
    CGContextAddLineToPoint(context,
                            LeftToView * 2, TopToView);
    
    CGContextAddLineToPoint(context,
                            LeftToView * 3, TopToView);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [self.tableView.backgroundColor setFill]; //设置填充色
    
    //    [self.tableView.backgroundColor setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
}



@end
