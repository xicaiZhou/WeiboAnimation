//
//  ZXC_Item.h
//  WeiBO_animation
//
//  Created by 周希财 on 2017/2/17.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZXC_Item : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) NSString *title;

//+ (ZXC_Item *)ItemWithImage:(UIImage *)image title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;
@end
