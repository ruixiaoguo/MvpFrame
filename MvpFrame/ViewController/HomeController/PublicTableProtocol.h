//
//  PublicTableProtocol.h
//  MvpFrame
//
//  Created by grx on 2018/9/5.
//  Copyright © 2018年 grx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PublicTableProtocol <NSObject>

- (void)requestSuccesReturn:(id)model;

- (void)requestFaildReturn:(id)error;

@end
