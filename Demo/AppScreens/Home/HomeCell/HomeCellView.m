//
//  HomeCell.m
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

#import "HomeCellView.h"

static int CELL_HEIGHT = 120;

@implementation HomeCellView

#pragma mark - Update Cell Data
//Update Empty cell with data
- (void)updateWithData:(NSString *)image :(NSString *)vehicleDetails  :(NSString *)regDetails  :(NSString *)totalPolicies  :(NSString *)remaingTime :(NSString *)statusText{
    self.vehicleImageView.image = [UIImage imageNamed:image];
    self.vehicleNameLabel.text = vehicleDetails;
    self.vehicleModelLabel.text = regDetails;
}

#pragma mark - UI
//| ----------------------------------------------------------------------------

- (void)initViews {
    // Initialization
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    //self.layer.borderColor = [UIColor redColor].CGColor;
    //self.layer.borderWidth = 1.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self initViews];
    }
    return self;
}

#pragma mark - 
- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}


/*
 //Send event to parent class - delegate
 if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnProductAddButton:)]) {
     [self.delegate didClickOnProductAddButton:event];
 */

@end
