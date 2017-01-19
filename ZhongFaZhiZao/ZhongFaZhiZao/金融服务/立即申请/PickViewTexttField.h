//
//  PickViewTexttField.h
//  BMTextField
//
//  Created by 北冥 on 2017/1/20.
//  Copyright © 2017年 BM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickViewTexttField : UITextField<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate>
{
    UIPickerView *pickView;
}

@property (nonatomic, strong) NSArray *dataArray;// pickerView的数据源, 比如 yes, no

- (void)setSelectRow:(NSInteger)index;// 选中列
@end
