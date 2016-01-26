//
//  ViewController.m
//  wall2
//
//  Created by James on 28/12/15.
//  Copyright © 2015 James. All rights reserved.
//
#import "ViewController.h"
#import "UUChart.h"
#import "UUBarChart.h"


@interface ViewController ()<UUChartDataSource>
{
    
    NSDate *firstdate;
    UUChart *chart;
    int path;
}


@end


@implementation ViewController
@synthesize flabel;
@synthesize slabel;
@synthesize tlabel;
@synthesize folabel;
@synthesize fivlabel;
@synthesize sixlabel;
@synthesize sevenlabel;
@synthesize dateLabel;
//@synthesize walletView;
@synthesize leftBtn;
@synthesize rightBtn;
@synthesize Customscrollview;
@synthesize tableView;



- (void)viewDidLoad {
    [super viewDidLoad];

    
    firstdate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:-6 toDate:[NSDate date] options:nil];
    //
    
    
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM,yyyy"];
    dateLabel.text = [dateFormat stringFromDate:[NSDate date]];
    dateLabel.text = [dateFormat stringFromDate: firstdate];
    
////
//    Customscrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,340,self.view.frame.size.width,self.view.frame.size.height-350)];
//    tableView.backgroundColor = [UIColor clearColor];
//    
//    
//
//    Customscrollview.showsVerticalScrollIndicator=YES;
//    Customscrollview.showsHorizontalScrollIndicator = YES;
//  
//    Customscrollview.userInteractionEnabled=YES;
//   
//    [self.view addSubview:Customscrollview];
//
    
    for (int x=0; x<=path; x++) {
        //[self dateChange];
        
        chart = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(5,self.view.frame.size.height- 270,[UIScreen mainScreen].bounds.size.width+40, 265) withSource:self
        withStyle:UUChartBarStyle];
        
       
        

        chart.layer.borderColor = [UIColor grayColor].CGColor;
        chart.layer.borderWidth = 1.0f;
        [chart showInView:self.view];
    }
       [self dateChange];


}

-(void)dateChange
{
    NSArray *labelArray = @[flabel, slabel, tlabel, folabel, fivlabel,sixlabel,sevenlabel];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    dateFormatter.dateFormat = @"ddMMM";
    for (NSInteger i = 0; i < 7; ++i) {
        NSDate *nextDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:i toDate:firstdate options:nil];
        UILabel *label = (UILabel *)labelArray[i];
        label.text = [dateFormatter stringFromDate:nextDate];
        if (i==6) {
            dateFormatter.dateFormat=@"MMM,yyyy";
            dateLabel.text = [[dateFormatter stringFromDate:nextDate] capitalizedString];
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            
            if ([[dateFormat stringFromDate:nextDate] isEqualToString:[dateFormat stringFromDate:[NSDate date]]])
            {
                rightBtn.enabled = false;
                
                //It's the same day
            }
            else
            {
                rightBtn.enabled = true;
            }
        }
    }
}
- (IBAction)calRight:(id)sender {
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    firstdate = [calendar dateByAddingUnit:NSCalendarUnitDay value:7 toDate:firstdate options:nil];
    [self dateChange];
    //////
    
    
}

- (IBAction)calLeft:(id)sender {
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    firstdate = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:firstdate options:nil];
    [self dateChange];
    
    
}





- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    
    return @[@"Jan11",@"Jan12",@"Jan13",@"Jan14",@"Jan15",@"Jan16",@"Jan17",@"Jan18",@"Jan19",@"Jan20",@"Jan22",@"Jan23",@"Jan24",@"Jan25"];
}

- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray *ary1 = @[@"22",@"54",@"15",@"30",@"42",@"77",@"43",@"76",@"34",@"54",@"23",@"16",@"32",@"17"];
    NSArray *ary2 = @[@"76",@"34",@"54",@"23",@"16",@"32",@"17",@"22",@"54",@"15",@"30",@"42",@"77",@"43"];

   
        return @[ary1,ary2];
}
#pragma mark - @optional
//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUBlue, UUGreen];
}
//显示数值范围
- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
{
    
    if (path==0) {
        return CGRangeMake(60, 10);
    }
    if (path==2) {
        return CGRangeMake(100, 0);
    }
    return CGRangeZero;
}

#pragma mark 折线图专享功能

//标记数值区域
- (CGRange)UUChartMarkRangeInLineChart:(UUChart *)chart
{
  
    if (path==2) {
        return CGRangeMake(25, 75);
    }
    return CGRangeZero;}

//判断显示横线条
- (BOOL)UUChart:(UUChart *)chart ShowHorizonLineAtIndex:(NSInteger)index
{
    return YES;
}

//判断显示最大最小值
- (BOOL)UUChart:(UUChart *)chart ShowMaxMinAtIndex:(NSInteger)index
{
    return 2;
}




-(void)dailyCalendarViewDidSelect:(NSDate *)date
{
    //You can do any logic after the view select the date
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
