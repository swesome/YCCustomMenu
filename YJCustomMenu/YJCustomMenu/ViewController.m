//
//  ViewController.m
//  YJCustomMenu
//
//  Created by hpyf on 2017/8/7.
//  Copyright © 2017年 Beijing Huapuyifang education technology co, LTD. All rights reserved.
//

#import "ViewController.h"
#import "YJCustomMenu.h"

@interface ViewController ()<YJCustomMenuDelegate>

@property (nonatomic, strong) YJCustomMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"schoolListItem.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showSchoolList:)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)showSchoolList:(UIBarButtonItem *)barButtonItem
{
    if (self.menu.isSeem) {
        [self.menu removeFromSuperview];
        self.menu.isSeem = NO;
    } else {
        [self.view addSubview:self.menu];
        self.menu.isSeem = YES;
    }
}

- (void)YJCustomMenu:(UITableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"select: %ld", indexPath.row);
}

- (YJCustomMenu *)menu {
    if (!_menu) {
        _menu = [[YJCustomMenu alloc] initWithDataArr:@[@"附近学校", @"联赛流程", @"其他联赛", @"校内群聊", @"邀请好友"] origin:CGPointMake(0, 0) width:125 rowHeight:44];
        _menu.delegate = self;
        _menu.arrImgName = @[@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
        _menu.isSeem = NO;
    }
    return _menu;
}

@end
