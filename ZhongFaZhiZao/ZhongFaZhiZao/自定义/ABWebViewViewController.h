//
//  ABWebViewViewController.h
//  LoveTourGuide
//
//  Created by Liu Zhao on 15/11/25.
//  Copyright © 2015年 pchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABWebViewViewController : UIViewController

- (instancetype)initWithUrlStr:(NSString *)urlStr;

- (instancetype)initWithUrlStr:(NSString *)urlStr title:(NSString *)title;

@end
