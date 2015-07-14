//
//  SalesCountDownView.h
//  MFWIOS
//
//  Created by william on 14/8/25.
//  Copyright (c) 2014年 mafengwo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCurNormalFontOfSize(size)      [UIFont systemFontOfSize:size]
#define kCurBoldFontOfSize(size)        [UIFont boldSystemFontOfSize:size]
#define COLOR_32425C                    [UIColor colorWithRed:0x32/255.0 green:0x42/255.0 blue:0x5C/255.0 alpha:1.0]
#define COLOR_Clear                     [UIColor clearColor]
#define COLOR_FFB000                    [UIColor colorWithRed:0xFF/255.0 green:0xB0/255.0 blue:0x00/255.0 alpha:1.0]
#define COLOR_White                     [UIColor whiteColor]

@interface SalesCountDownView : UIView
- (void)startCountDownTime:(NSInteger)countDownTime andEndTime:(NSInteger)endTime;

+ (CGFloat)heightForCountDownView;
@end
