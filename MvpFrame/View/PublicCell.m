//
//  PublicCell.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicCell.h"
#import "UIImageView+AFNetworking.h"

@interface PublicCell ()
@property (strong, nonatomic) UILabel *userName;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UITextView *weiboText;

@end

@implementation PublicCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self creatCell];
    }
    return self;
    
}

-(void)creatCell
{
    self.userName = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 30)];
    [self.contentView addSubview:self.userName];
    self.date = [[UILabel alloc]initWithFrame:CGRectMake(230, 10, 150, 30)];
    [self.contentView addSubview:self.date];
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 80, 70)];
    [self.contentView addSubview:self.headImageView];
    self.weiboText = [[UITextView alloc]initWithFrame:CGRectMake(20, 120, 200, 80)];
    self.weiboText.editable = NO;
    [self.contentView addSubview:self.weiboText];
}

-(void) setValueWithDic : (PublicModel *) publicModel
{
    _userName.text = publicModel.userName;
    _date.text = publicModel.date;
    _weiboText.text = publicModel.text;
    _headImageView.image = [UIImage imageNamed:@"health_banner"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
