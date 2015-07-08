//
//  LabelStylesheet.m
//  SwiftStudies
//
//  Created by Taqtile on 7/8/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

#import "LabelStylesheet.h"
#import "Colors.h"
#import "Stylesheet.h"
#import <UIKit/UIKit.h>
#import "Fonts.h"

@implementation LabelStylesheet

+ (NSDictionary *)stylesheet {
    return @{
             @"H3_Label": @{
                     PK_LABEL_TEXT_COLOR: COLOR_SWATCH_PRIMARY_COLOR,
                     PK_LABEL_FONT: [UIFont fontWithName:FONT_NAME_NETSHOES_REGULAR size:FONT_SIZE_EXTRA_LARGE]
                     },
             };
}


@end
