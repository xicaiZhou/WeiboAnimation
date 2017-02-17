//
//  ViewController.m
//  WeiBO_animation
//
//  Created by 周希财 on 2017/2/17.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "ZXC_Item.h"
@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.btn];
}

-(UIButton *)btn{

    if (_btn == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 40);
        button.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 40);
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(animation) forControlEvents:UIControlEventTouchUpInside];
        _btn = button;
    }
    return _btn;
}
- (void)animation{
    
    MainViewController *main = [[MainViewController alloc] init];
    
    ZXC_Item *item = [ZXC_Item itemWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    ZXC_Item *item1 = [ZXC_Item itemWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    ZXC_Item *item2 = [ZXC_Item itemWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    ZXC_Item *item3 = [ZXC_Item itemWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    ZXC_Item *item4 = [ZXC_Item itemWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    ZXC_Item *item5 = [ZXC_Item itemWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    ZXC_Item *item6 = [ZXC_Item itemWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    ZXC_Item *item7 = [ZXC_Item itemWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    ZXC_Item *item8 = [ZXC_Item itemWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    ZXC_Item *item9 = [ZXC_Item itemWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    ZXC_Item *item10 = [ZXC_Item itemWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    ZXC_Item *item11 = [ZXC_Item itemWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    
    main.itemArray = @[item,
                       item1,
                       item2,
                       item3,
                       item4,
                       item5,
                       item6,
                       item8,
                       item7,
                       item9,
                       item10,
                       item11];
    [self presentViewController:main animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
