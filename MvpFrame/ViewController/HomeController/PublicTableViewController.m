//
//  PublicTableViewController.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//
#define TOKEN @"access_token"
#define COUNT @"count"
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"

#import "PublicTableViewController.h"
#import "SVProgressHUD.h"
#import "PublicPresenter.h"
#import "PublicCell.h"
#import "PublicTableProtocol.h"

@interface PublicTableViewController ()<PublicTableProtocol>

@property (strong, nonatomic) NSMutableArray *publicModelArray;

@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[PublicCell class] forCellReuseIdentifier:@"PublicCell"];
    self.publicModelArray = [NSMutableArray arrayWithCapacity:0];
    [SVProgressHUD showWithStatus:@"正在获取用户信息……" maskType:SVProgressHUDMaskTypeBlack];
    NSDictionary *parameter = @{TOKEN: ACCESSTOKEN,
                                COUNT: @"100"
                                };
    [[PublicPresenter sharedInstance:self]fetchPublicWeiBoWithDic:parameter];
}

#pragma mark - PublicTableProtocol
- (void)requestSuccesReturn:(id)model
{
    [self.publicModelArray removeAllObjects];
    [self.publicModelArray addObjectsFromArray:model];
    [self.tableView reloadData];
    NSLog(@"%@",_publicModelArray);
    [SVProgressHUD dismiss];
}

-(void)requestFaildReturn:(id)error
{
    NSLog(@"请求失败");
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _publicModelArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCell" forIndexPath:indexPath];
    [cell setValueWithDic:_publicModelArray[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[PublicPresenter sharedInstance:self] weiboDetailWithPublicModel:_publicModelArray[indexPath.row] WithViewController:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
