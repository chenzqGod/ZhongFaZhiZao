//
//  FeedBackViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/8.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setTitle:@"意见反馈"];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-64)];
    
    [self.view addSubview:self.scrollView];
    
    [self createUI];
}

- (void)createUI {

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 40*screenH)];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(Margin, 100, screenWidth-2*Margin, 123*screenH)];
    
    
    
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
