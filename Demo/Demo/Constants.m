//
//  Constants.m
//
//  Created by xibic on 9/28/15.
//

#import "Constants.h"

@implementation Constants

#pragma mark - Constants
const struct ConstantsStruct AppConstants = {
    .Title = @""
};

#pragma mark - Fonts
const struct FontsStruct Fonts = {
    .Regular = @"Roboto-Regular",
    .Light = @"Roboto-Light",
    .Bold = @"Roboto-Bold",
    .Medium = @"Roboto-Medium",
    .Thin = @"Roboto-Thin",
    .HeaderFontSize = 16,
    .TitleFontSize = 13,
    .ContentFontSize = 10
};


#pragma mark - App Color
const struct AppColorStruct AppColor = {
    .tabBarColor = @"#16a085",
    .navBarColor = @"#16a085",
    .fontColor = @"000000",
    .textTitleColor = @"22313F",
    .textContentColor = @"#808080",
    .backgroundColor = @"#EEEEFF"
    //Button green/TakingAction - #3FE99A
    //Primary - #4243C4
    //SecondaryCTA - #5B5DFF
    //Warning - #FED734
    //Grey - #8F8E9E
    //
};



#pragma mark - Generic
NSString *const kMyFirstConstant = @"FirstConstant";
const int kMyID = 9;

@end
