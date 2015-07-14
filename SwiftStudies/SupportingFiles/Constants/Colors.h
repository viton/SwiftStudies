//
//  Colors.h
//  Netshoes
//
//  Created by Taqtile on 4/10/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#ifndef Netshoes_Colors_h
#define Netshoes_Colors_h

// Color methods
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
#define HEXA(hexValue,a) [UIColor colorWithRed:((float)((hexValuergbValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValuergbValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValuergbValue & 0xFF))/255.0 alpha:a]

// New colors
#define COLOR_SWATCH_PRIMARY_COLOR             HEX(0x5B2B85)
#define COLOR_SWATCH_TERTIARY_COLOR            RGB(58, 208, 239)
#define COLOR_SWATCH_TERTIARY_DARK_COLOR       RGB(109, 172, 185)
#define COLOR_SWATCH_TERTIARY_DARKER_COLOR     RGB(34, 124, 143)
#define COLOR_SWATCH_ERROR                     RGB(250, 91, 100)
#define COLOR_SWATCH_SUCCESS                   RGB(73, 207, 170)
#define COLOR_SWATCH_PURPLE_DARK               RGB(91, 43, 133)

#define COLOR_SWATCH_CLEAR                     [UIColor clearColor]
#define COLOR_SWATCH_WHITE                     HEX(0xFFFFFF)

#define COLOR_SWATCH_GRAY_LIGHT                RGB(248, 248, 248)
#define COLOR_SWATCH_GRAY                      RGB(208,208,208)
#define COLOR_SWATCH_GRAY_DARK                 HEX(0xADADAD)
#define COLOR_SWATCH_GRAY_DARKER               HEX(0x666666)
#define COLOR_SWATCH_BLACK                     HEX(0x434343)

// Ancient Color
// TODO: remove the colors that are not used from this list https://github.com/indigotech/br-netshoes-app-ios/issues/93
#define COLOR_BLUE                RGB(0X05, 0xa8, 0xe3)
#define COLOR_PEACH               RGB(0Xf2, 0x6d, 0x7d)
#define COLOR_PRETO               RGB(0X00, 0x00, 0x00)
#define COLOR_BRANCO              RGB(0Xff, 0xff, 0xff)
#define COLOR_PURPLE              RGB(0X72, 0x35, 0x91)
#define COLOR_PURPLE_LIGHT        RGB(0Xf5, 0xe5, 0xfb)
#define COLOR_ORANGE              RGB(0Xff, 0x7e, 0x00)
#define COLOR_CIANO               RGB(0X2f, 0xda, 0xd4)
#define COLOR_LILAS               RGB(0X82, 0x8b, 0xd2)
#define COLOR_MAGENTA_LIGHT       RGB(0Xa9, 0x57, 0x83)
#define COLOR_ORANGE_LIGHT        RGB(0Xf6, 0x88, 0x2e)
#define COLOR_MOSTARDA            RGB(0Xb9, 0xd4, 0x25)
#define COLOR_PINK                RGB(0Xd4, 0x25, 0xce)
#define COLOR_PURPLE_DARK         RGB(0X94, 0x25, 0xd4)
#define COLOR_MAGENTA_DARK        RGB(0Xd4, 0x25, 0x6b)
#define COLOR_EXCLUSIVO           RGB(0Xa4, 0x33, 0x9a)
#define COLOR_LANCAMENTO          RGB(0Xf0, 0x00, 0x9b)
#define COLOR_DESCONTO            RGB(0Xff, 0x53, 0x6c)
#define COLOR_SELECOES            RGB(0X0a, 0x6a, 0x40)
#define COLOR_PERSONALIZE         RGB(0X00, 0x6b, 0x6e)
#define COLOR_PRE_VENDA           RGB(0Xff, 0xd2, 0x00)
#define COLOR_BLUE_TEXT           RGB(0X0b, 0xbd, 0xe3)
#define COLOR_GRAY_CADASTRO       RGB(0Xd9, 0xdb, 0xe9)
#define COLOR_GRAY_TEXT           RGB(0X5d, 0x60, 0x62)
#define COLOR_BLACK_SIZES         RGB(0x4d, 0x4d, 0x4d)
#define COLOR_BLUE_SIZES          RGB(0x0b, 0xbd, 0xe3)
#define COLOR_GRAY_LIGHT          RGB(0Xed, 0xee, 0xf2)
#define COLOR_RED_LIGHT           RGB(0Xf2, 0x6d, 0x7d)
#define COLOR_BLUE_STATUS         RGB(0x4c, 0xb0, 0xe8)
#define COLOR_RED_STATUS          RGB(0xe8, 0x4c, 0x4c)
#define COLOR_GREEN_STATUS        RGB(0x4c, 0xe8, 0x78)
#define COLOR_PURPLE_TRANSLUCID   RGBA(0X72, 0x35, 0x91, 0.1)
#define COLORRED                  RGB(0xc0, 0x00, 0x00)

#endif
