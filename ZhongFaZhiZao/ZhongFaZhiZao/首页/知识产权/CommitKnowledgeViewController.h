//
//  CommitKnowledgeViewController.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/19.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderTextView.h"

@interface CommitKnowledgeViewController : UIViewController

@property (nonatomic,copy) NSString *styleStr;
@property (nonatomic,strong) UITextField *areasTF;
@property (nonatomic,strong) UITextField *nameTF;
@property (nonatomic,strong) UITextField *phoneTF;
@property (nonatomic,strong) PlaceholderTextView *issueTF;
@property (nonatomic,copy) NSString *typeId;

@end
