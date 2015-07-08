//
//  ViewStylesheet.m
//  Netshoes
//
//  Created by Taqtile on 4/29/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "ViewStylesheet.h"
#import "Colors.h"
#import "Stylesheet.h"
#import <UIKit/UIKit.h>

@implementation ViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"ViewWithLightBackground_View": @{
                     PK_VIEW_BACKGROUND_COLOR: COLOR_SWATCH_GRAY_LIGHT
                     },
             @"ViewWithWhiteBackground_View": @{
                     PK_VIEW_BACKGROUND_COLOR: COLOR_SWATCH_WHITE
                     },
             @"Separator_View": @{
                     PK_VIEW_BACKGROUND_COLOR: COLOR_SWATCH_GRAY
                     },
             @"ViewWithClearBackground_View": @{
                     PK_VIEW_BACKGROUND_COLOR: COLOR_SWATCH_CLEAR
                     }
             };
}

@end
