//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Parker Donat on 4/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()
@property (nonatomic, strong) NSMutableArray *scoreLabels;
@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabels = [[NSMutableArray alloc] init];
    
    self.title = @"Score Keeper";
    UIScrollView *newScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    newScrollView.backgroundColor = [UIColor grayColor];
    
    /*UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, 200, 200)];
    title.text = @"Score Keeper";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont boldSystemFontOfSize:20];
    title.backgroundColor = [UIColor blueColor];
     
    [newScrollView setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    [newScrollView addSubview:title];*/
    [self.view addSubview:newScrollView];
    
}
- (void) addScoreView:(int)index
{
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, width, height)];
    
    UITextField *name = [[UITextField alloc] init];
    CGRect nameFrame = name.frame;
    nameFrame.origin = CGPointMake(10, 50);
    name.frame = nameFrame;
    name.placeholder = @"Name";
    [view addSubview:name];
    
    UILabel *score = [[UILabel alloc] init];
    CGRect scoreFrame = score.frame;
    scoreFrame.origin = CGPointMake(100, 50);
    score.frame = scoreFrame;
    [view addSubview:score];

    [self.scoreLabels addObject:score];
    
    UIStepper *minusPlus = [[UIStepper alloc] init];//WithFrame:CGRectMake(300, 20, 40, 40)];
    CGRect minusPlusFrame = minusPlus.frame;
    minusPlusFrame.origin = CGPointMake(200, 50);
    minusPlus.frame = minusPlusFrame;
    minusPlus.minimumValue = -10;
    minusPlus.maximumValue = 100;
    [view addSubview:minusPlus];
    minusPlus.tag = index;
    
    [self.view addSubview:view];
    
    //score ++ scoreLabels array everytime index changes
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
