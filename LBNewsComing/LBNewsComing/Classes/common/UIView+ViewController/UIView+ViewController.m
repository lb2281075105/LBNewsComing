//
//  UIView+ViewController.m
//  WXWeibo_21
//
//  Created by keyzhang on 14-7-4.
//  Copyright (c) 2014年 keyzhang. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
        
    } while (next != nil);
    
    return nil;
}


@end
