//
//  TableViewController.m
//  YYCountDownTableview
//
//  Created by william on 15/7/14.
//  Copyright (c) 2015年 william. All rights reserved.
//

#import "TableViewController.h"
#import "SalesCountDownView.h"
#import "UIView+Frame.h"

#define numberOfRow         20

@interface TableViewController(){
    NSTimer *_timer;
}

@property(nonatomic, strong)NSMutableArray *timeArray;

@end

@implementation TableViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.timeArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<numberOfRow; i++) {
        NSDictionary *timeInfo = @{@"row":[NSString stringWithFormat:@"%d",i]
                                   ,@"section":@"0"
                                   ,@"star_time":[NSString stringWithFormat:@"%d",(i+1)*100]
                                   ,@"end_time":[NSString stringWithFormat:@"%d",(i+1)*100 + 10]};
        [self.timeArray addObject:timeInfo];
    }
    
    if (self.timeArray.count>0) {
        [self _startTimer];
    }else{
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)_startTimer
{
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(_refreshLessTime) userInfo:@"" repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    
}
- (void)_refreshLessTime
{
    NSInteger start_time;
    NSInteger end_time;
    for (int i = 0; i < self.timeArray.count; i++) {
        start_time = [[[self.timeArray objectAtIndex:i] objectForKey:@"start_time"] integerValue];
        end_time = [[[self.timeArray objectAtIndex:i] objectForKey:@"end_time"] integerValue];
        
        NSInteger row = [[[self.timeArray objectAtIndex:i] objectForKey:@"row"] integerValue];
        NSInteger section = [[[self.timeArray objectAtIndex:i] objectForKey:@"section"] integerValue];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        UITableViewCell *cell = (UITableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        
        --start_time;
        --end_time;
        SalesCountDownView *countdownView = (SalesCountDownView *)[cell viewWithTag:999];
        [countdownView startCountDownTime:start_time andEndTime:end_time];
        
        if (end_time < 0) {
            [self.timeArray removeObjectAtIndex:i];
            i--;
        }else{
            NSDictionary *dic = @{@"section":[NSString stringWithFormat:@"%lu",(long)section],@"row":[NSString stringWithFormat:@"%lu",(long)row],@"start_time": [NSString stringWithFormat:@"%ld",(long)start_time],@"end_time":[NSString stringWithFormat:@"%ld",(long)end_time]};
            [self.timeArray replaceObjectAtIndex:i withObject:dic];
        }
    }
    if (self.timeArray.count <= 0) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return numberOfRow;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIndentifier"];
        cell.centerX = cell.centerX;
        
        SalesCountDownView *cdView = [[SalesCountDownView alloc]initWithFrame:CGRectMake(0, 0, tableView.width, 25)];
        cdView.tag = 999;
        [cell addSubview:cdView];
    }
    return cell;
}
@end
