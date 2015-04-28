//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Parker Donat on 4/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

static CGFloat scoreViewHeight = 90;

@interface ScoreViewController () <UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *scoreLabels;
@property UIScrollView *scrollView;

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabels = [[NSMutableArray alloc] init];
    
    self.title = @"Score Keeper";
    
    UIScrollView *newScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    newScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:newScrollView];
    self.scrollView = newScrollView;
    
    for (int i=0; i<4; i++) {
        [self addScoreView:i];
    }
    
    /*UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, 200, 200)];
    title.text = @"Score Keeper";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont boldSystemFontOfSize:20];
    title.backgroundColor = [UIColor blueColor];
     
    [newScrollView setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    [newScrollView addSubview:title];*/
    
}
- (void) addScoreView:(int)index
{
    //CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, index * scoreViewHeight, width, scoreViewHeight)];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 90, 30)];
    name.delegate = self;
    name.tag = -1000;
    name.placeholder = @"Name";
    [view addSubview:name];
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 40, 30)];
    score.backgroundColor = [UIColor whiteColor];
    [view addSubview:score];
    

    [self.scoreLabels addObject:score];
    
    UIStepper *minusPlus = [[UIStepper alloc] initWithFrame:CGRectMake(200, 30, 40, 40)];
    /*CGRect minusPlusFrame = minusPlus.frame;
    minusPlusFrame.origin = CGPointMake(200, 50);
    minusPlus.frame = minusPlusFrame; */
    minusPlus.minimumValue = -100;
    minusPlus.maximumValue = 100;
    [view addSubview:minusPlus];
    minusPlus.tag = index;
    [minusPlus addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventValueChanged];
    
    [self.scrollView addSubview:view];
    
    //score ++ scoreLabels array everytime index changes
    
}
    // This is the code to take away the the keyboard after input.
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)buttonTapped:(UIStepper *)sender{

    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    int value = [stepper value];
    
    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat:@"%d", value];
    
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
