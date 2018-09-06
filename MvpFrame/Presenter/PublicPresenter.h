//
//  PublicPresenter.h
//  MvpFrame
//
//  Created by grx on 2018/9/5.
//  Copyright © 2018年 grx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PublicModel.h"
#import "PublicTableProtocol.h"

@interface PublicPresenter : NSObject

@property (nonatomic,weak) id <PublicTableProtocol> delegate;

+ (PublicPresenter *)sharedInstance:(id<PublicTableProtocol>)view;

//获取围脖列表
- (void)fetchPublicWeiBoWithDic:(NSDictionary *)dic;

//跳转到微博详情页
-(void) weiboDetailWithPublicModel: (PublicModel *) publicModel WithViewController: (UIViewController *)superController;

@end
