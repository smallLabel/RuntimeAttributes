//
//  ViewController.h
//  RuntimeAttributes
//
//  Created by lijunhong on 2017/5/10.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToController:(ViewController *)controller;

- (NSUInteger)hash;


@end

