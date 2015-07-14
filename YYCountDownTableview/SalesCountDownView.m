//
//  SalesCountDownView.m
//  MFWIOS
//
//  Created by william on 14/8/25.
//  Copyright (c) 2014年 mafengwo. All rights reserved.
//

#import "SalesCountDownView.h"
#import "UIView+Frame.h"
#define TIMELABELWIDTH          18
#define TIMELABELHEIGHT         24
#define TIMELABELcornerRadius   2
#define DIVISIONWIDTH           10

@interface SalesCountDownView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *hourLabel;
@property (nonatomic, strong) UILabel *minuteLabel;
@property (nonatomic, strong) UILabel *secondsLabel;

@property (nonatomic, strong) UIView *backgroundHour;
@property (nonatomic, strong) UIView *backgroundMin;
@property (nonatomic, strong) UIView *backgroundSecond;

@property (nonatomic, strong) UILabel *divisionLabel0;
@property (nonatomic, strong) UILabel *divisionLabel1;
@property (nonatomic, strong) UILabel *divisionLabel2;
@property (nonatomic, strong) UILabel *divisionLabel3;

@property (nonatomic, assign) NSInteger countDownTime;

@property (nonatomic, assign) NSInteger endTime;

@end

@implementation SalesCountDownView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kCurNormalFontOfSize(12);
        _titleLabel.text = @"";
        _titleLabel.backgroundColor = COLOR_Clear;
        _titleLabel.textColor = COLOR_32425C;
        _titleLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_titleLabel];
        
        _backgroundHour = [[UIView alloc]init];
        _backgroundHour.backgroundColor =COLOR_32425C;
        _backgroundHour.layer.cornerRadius = TIMELABELcornerRadius;
        [self addSubview:_backgroundHour];

        
        _backgroundMin = [[UIView alloc]init];
        _backgroundMin.backgroundColor = COLOR_32425C;
        _backgroundMin.layer.cornerRadius = TIMELABELcornerRadius;
        [self addSubview:_backgroundMin];
        
        _backgroundSecond = [[UIView alloc]init];
        _backgroundSecond.backgroundColor = COLOR_32425C;
        _backgroundSecond.layer.cornerRadius = TIMELABELcornerRadius;
        [self addSubview:_backgroundSecond];
        
        _divisionLabel0 = [[UILabel alloc]init];
        _divisionLabel0.text = @"天";
        _divisionLabel0.textAlignment = NSTextAlignmentCenter;
        _divisionLabel0.font = kCurNormalFontOfSize(12);
        _divisionLabel0.backgroundColor = COLOR_Clear;
        _divisionLabel0.textColor = COLOR_32425C;
        _divisionLabel0.hidden = YES;
        [self addSubview:_divisionLabel0];
        
        _divisionLabel1 = [[UILabel alloc]init];
        _divisionLabel1.text = @":";
        _divisionLabel1.textAlignment = NSTextAlignmentCenter;
        _divisionLabel1.font = kCurNormalFontOfSize(10);
        [self addSubview:_divisionLabel1];
        
        _divisionLabel2 = [[UILabel alloc]init];
        _divisionLabel2.text = @":";
        _divisionLabel2.textAlignment = NSTextAlignmentCenter;
        _divisionLabel2.font = kCurNormalFontOfSize(10);
        [self addSubview:_divisionLabel2];
        
        _dayLabel = [[UILabel alloc]init];
        _dayLabel.font = kCurBoldFontOfSize(17);
        _dayLabel.textColor = COLOR_FFB000;
        _dayLabel.backgroundColor = COLOR_Clear;
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.hidden = YES;
        [self addSubview:_dayLabel];
        
        _hourLabel = [[UILabel alloc]init];
        _hourLabel.font = kCurNormalFontOfSize(10);
        _hourLabel.textColor = COLOR_White;
        _hourLabel.backgroundColor = COLOR_Clear;
        _hourLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_hourLabel];
        
        _minuteLabel = [[UILabel alloc]init];
        _minuteLabel.font = kCurNormalFontOfSize(10);
        _minuteLabel.textColor = COLOR_White;
        _minuteLabel.backgroundColor = COLOR_Clear;
        _minuteLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_minuteLabel];
        
        _secondsLabel = [[UILabel alloc]init];
        _secondsLabel.font = kCurNormalFontOfSize(10);
        _secondsLabel.textColor = COLOR_White;
        _secondsLabel.backgroundColor = COLOR_Clear;
        _secondsLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_secondsLabel];
    }
    return self;
}
- (void)startCountDownTime:(NSInteger)countDownTime andEndTime:(NSInteger)endTime{
    
    _countDownTime = countDownTime;
    _endTime = endTime;
    [self refreshView];
}

- (void)refreshView{
    
    NSInteger computTime = 0;
    
    if (_endTime <= 0) {
        _titleLabel.text = @"已结束";
        _titleLabel.centerX = self.centerX;
    }else{
        _hourLabel.hidden = NO;
        if (_countDownTime <= 0) {
            _titleLabel.text = @"距结束";
            computTime = _endTime;
        }else{
            _titleLabel.text = @"距开始";
            computTime = _countDownTime;
        }
    }
    
    NSInteger day = computTime/(3600 * 24);
    NSInteger hour = (computTime%(3600 * 24))/3600;
    NSInteger min = computTime%3600/60;
    NSInteger sec = computTime%60;
    
    _dayLabel.text = day<10 ? [NSString stringWithFormat:@"0%ld", (long)day] : [NSString stringWithFormat:@"%ld", (long)day];
    _dayLabel.hidden = day <= 0;
    [_dayLabel sizeToFit];
    _divisionLabel0.hidden = _dayLabel.hidden;
    
    _hourLabel.text = hour<10 ? [NSString stringWithFormat:@"0%ld", (long)hour] : [NSString stringWithFormat:@"%ld", (long)hour];
    _minuteLabel.text = min<10 ? [NSString stringWithFormat:@"0%ld", (long)computTime%3600/60] : [NSString stringWithFormat:@"%ld", (long)computTime%3600/60];
    _secondsLabel.text = sec<10 ? [NSString stringWithFormat:@"0%ld", (long)computTime%60] : [NSString stringWithFormat:@"%ld", (long)computTime%60];
    
    [self layoutSubviews];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    float top =(self.frame.size.height - TIMELABELHEIGHT)/2;
    _titleLabel.frame = CGRectMake(3, top, 50, 14);
    if (_endTime<=0) {
        _titleLabel.centerX = self.centerX;
    }

    BOOL viewHidden = (_endTime <= 0 || _endTime < _countDownTime);
    
    _dayLabel.frame = CGRectMake(_titleLabel.right + 4, top, TIMELABELWIDTH, TIMELABELHEIGHT);
    [_dayLabel sizeToFit];
    _dayLabel.y = _titleLabel.y - 4;
    _divisionLabel0.frame = CGRectMake(_dayLabel.right, top, DIVISIONWIDTH * 2, TIMELABELHEIGHT);
    
    _hourLabel.frame = CGRectMake(_divisionLabel0.right, top, TIMELABELWIDTH, TIMELABELHEIGHT);
    if (_divisionLabel0.hidden) {
        _hourLabel.x = _titleLabel.right+8;
    }
    _divisionLabel1.frame = CGRectMake(_hourLabel.right, top, DIVISIONWIDTH, TIMELABELHEIGHT);
    _hourLabel.hidden = viewHidden;
    _divisionLabel1.hidden = viewHidden;
    
    _minuteLabel.frame = CGRectMake(_divisionLabel1.right, top, TIMELABELWIDTH, TIMELABELHEIGHT);
    _divisionLabel2.frame = CGRectMake(_minuteLabel.right, top, DIVISIONWIDTH, TIMELABELHEIGHT);
    _minuteLabel.hidden = viewHidden;
    _divisionLabel2.hidden = viewHidden;
    
    _secondsLabel.frame = CGRectMake(_divisionLabel2.right, top, TIMELABELWIDTH, TIMELABELHEIGHT);
    _divisionLabel3.frame = CGRectMake(_secondsLabel.right, top, DIVISIONWIDTH, TIMELABELHEIGHT);
    _secondsLabel.hidden = viewHidden;
    _divisionLabel3.hidden = viewHidden;
    
    _backgroundHour.frame = _hourLabel.frame;
    _backgroundHour.hidden = _hourLabel.hidden;
    
    _backgroundHour.frame = _hourLabel.frame;
    _backgroundHour.hidden = _hourLabel.hidden;
    
    _backgroundMin.frame = _minuteLabel.frame;
    _backgroundMin.hidden = _minuteLabel.hidden;
    
    _backgroundSecond.frame = _secondsLabel.frame;
    _backgroundSecond.hidden = _secondsLabel.hidden;
    
    self.width = _backgroundSecond.right + 10;
}

+ (CGFloat)heightForCountDownView{
    
    return 35.0f;
    
}
@end
