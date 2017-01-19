//
//  PickViewTexttField.m
//  BMTextField
//
//  Created by 北冥 on 2017/1/20.
//  Copyright © 2017年 BM. All rights reserved.
//

#import "PickViewTexttField.h"

@implementation PickViewTexttField
{
    UIToolbar *inputAccessoryView;// 键盘上方的toolbal, 用于加入done按钮完成输入
    NSString *selectString;
}

@synthesize dataArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setSelectRow:(NSInteger)index
{
    if (index >=0 ) {
        [pickView selectRow:index inComponent:0 animated:YES];// 选中哪一列
    }
}

- (void)drawRect:(CGRect)rect
{
    pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 120)];// 新建pickerView, 我是在3.5上运行的, 6/6plus或许宽度不同.
    pickView.dataSource = self;
    pickView.delegate = self;
    self.inputView = pickView;// 重点！ 这样点击TextField就会弹出pickerView了.
    
//    [self setText:[dataArray objectAtIndex:0]];
    // 设置TextField默认显示pickerView第一列的内容
}

#pragma mark - UIPickerView dataSource, delegate
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dataArray count];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [dataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectString = [dataArray objectAtIndex:row];
}

#pragma mark - inputAccessoryView with toolbar
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)done:(id)sender {
    [self resignFirstResponder];
    [super resignFirstResponder];
    self.text = selectString;
}
- (void)cancel:(id)sender {
    [self resignFirstResponder];
    [super resignFirstResponder];
}
/* 创建toolbar */
- (UIView *)inputAccessoryView {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return nil;
    } else {
        if (!inputAccessoryView) {
            inputAccessoryView = [[UIToolbar alloc] init];
            inputAccessoryView.barStyle = UIBarStyleDefault;
            inputAccessoryView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            [inputAccessoryView sizeToFit];
            CGRect frame = inputAccessoryView.frame;
            frame.size.height = 30.0f;
            inputAccessoryView.frame = frame;
            
//            UIBarButtonItem *doneBtn =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(done:)];
//            UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:nil action:nil];
            UIBarButtonItem *btncancel = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:) ];
            UIBarButtonItem *btnSpace =
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                          target:nil
                                                          action:nil];

             UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(done:) ];
            
            
            NSArray *array = [NSArray arrayWithObjects: btncancel,btnSpace,doneBtn , nil];
            [inputAccessoryView setItems:array];  
        }  
        return inputAccessoryView;  
    }  
}  

@end
