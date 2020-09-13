//
//  HomeCell.h
//  Demo
//
//  Created by xibic on 7/28/20.
//  Copyright © 2020 Mohammad Sazibul Islam. All rights reserved.
//

@protocol HomeCellViewCellDelegate <NSObject>

- (void)didClickOnProductAddButton:(id)event;

@end


@interface HomeCellView : UITableViewCell

@property (weak, nonatomic) id<HomeCellViewCellDelegate>delegate;

//Vehicle Image
@property (weak, nonatomic) IBOutlet UIImageView *vehicleImageView;

//Vehicle Name
@property (weak, nonatomic) IBOutlet UILabel *vehicleNameLabel;

//Vehicle Model
@property (weak, nonatomic) IBOutlet UILabel *vehicleModelLabel;

//Update cell with the Vehcile data 
- (void)updateWithData:(NSString *)image :(NSString *)vehicleDetails  :(NSString *)regDetails  :(NSString *)totalPolicies  :(NSString *)remaingTime :(NSString *)statusText;

@end
