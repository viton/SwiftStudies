//
//  BaseStylesheet.m
//  Netshoes
//
//  Created by Taqtile on 4/23/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "BaseStylesheet.h"
#import "Colors.h"
#import "Stylesheet.h"
#import "Fonts.h"
#import <UIKit/UIKit.h>

@implementation BaseStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"UILabel": @{
                    PK_LABEL_FONT: [UIFont fontWithName:FONT_NAME_NETSHOES_REGULAR size:FONT_SIZE_MEDIUM],
                    PK_LABEL_TEXT_COLOR:COLOR_SWATCH_BLACK
                     },
             };
}
@end
