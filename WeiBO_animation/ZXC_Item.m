//
//  ZXC_Item.m
//  WeiBO_animation
//
//  Created by 周希财 on 2017/2/17.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ZXC_Item.h"

@implementation ZXC_Item

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title
{
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image{

    ZXC_Item *item = [[self alloc] initWithImage:image title:title];
    
    return item;
}
@end
