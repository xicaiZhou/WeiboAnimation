//
//  MainViewController.m
//  WeiBO_animation
//
//  Created by 周希财 on 2017/2/17.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "MainViewController.h"
#import "ZXC_Btn.h"
#import "ZXC_Item.h"
#define BtnWH 100

#define Screen_Bounds [[UIScreen mainScreen] bounds]

#define Screen_Width CGRectGetWidth(Screen_Bounds)

#define Screen_Height CGRectGetHeight(Screen_Bounds)
@interface MainViewController ()

{
    UIImageView *im;
    BOOL IsSelected;
    UIView *BtnMenuView;
    UIView *addcurrentPagereturnBtn;
    NSTimer *time;
    NSTimer *returnTime;
    int indexBtn;
    int realityIndex;
    int currentPage;
    int returnBtnIndex;
}
@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    currentPage = 1;
    returnBtnIndex = 11;
    
    [self addBtn];

    [self time];
}
- (void)time{

    time = [NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(update) userInfo:nil repeats:YES];
  
}
- (void)returnTime{

    returnTime = [NSTimer scheduledTimerWithTimeInterval:0.09 target:self selector:@selector(hiddenAnimation) userInfo:nil repeats:YES];
}
- (void)update{

    NSLog(@"%s",__func__); //查看time是否死循环
    //保护
    if (realityIndex == _itemArray.count) {
        
        [time invalidate];
        return;
    }
    if (indexBtn > 2 && indexBtn < 6) {
        
        indexBtn += 2;
    }
    else{
        indexBtn = realityIndex;
    }
    
    ZXC_Btn *btn = [[BtnMenuView subviews] objectAtIndex:indexBtn];
    indexBtn -= 2;
    [UIView animateWithDuration:.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        
        btn.transform = CGAffineTransformIdentity;
        
    } completion:nil];
    indexBtn ++;
    realityIndex ++;
    
}
- (void)addBtn{

    [self addReturnBtn];
    [self addcurrentPagereturnBtn];
    [self addBtnMenuView];
}

#pragma mark addBtn
- (void)addReturnBtn{
    
    UIImage *image = [UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"];
    im = [[UIImageView alloc] initWithImage:image];
    im.frame = CGRectMake(0, 0, 30, 30);
    im.center = CGPointMake(Screen_Width / 2, Screen_Height - 40);
    im.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
    IsSelected = YES;
    //为图片添加手势
    singleTap.numberOfTapsRequired = 1;//单机,轻拍一次
    singleTap.numberOfTouchesRequired = 1;//一个手指头
    [im addGestureRecognizer:singleTap];
    [self.view addSubview:im];
}
- (void)addcurrentPagereturnBtn{

    addcurrentPagereturnBtn = [[UIView alloc] init];
    addcurrentPagereturnBtn.backgroundColor = [UIColor whiteColor];
    addcurrentPagereturnBtn.frame = CGRectMake(0, Screen_Height - 60, Screen_Height, 50);
    UIButton *PagereturnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PagereturnBtn.frame = CGRectMake(Screen_Width / 4 - 15, 0, 30, 30);
    [PagereturnBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [PagereturnBtn addTarget:self action:@selector(Pagereturn) forControlEvents:UIControlEventTouchUpInside];
    [addcurrentPagereturnBtn addSubview:PagereturnBtn];
    [self.view addSubview:addcurrentPagereturnBtn];
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.frame = CGRectMake(Screen_Width / 4 * 3 - 15, 0, 30, 30);
    [returnBtn addTarget:self action:@selector(returnBtn) forControlEvents:UIControlEventTouchUpInside];
    [returnBtn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
    
    [addcurrentPagereturnBtn addSubview:returnBtn];
    
    addcurrentPagereturnBtn.alpha = 0;
}
- (void)addBtnMenuView{
    int cloumn = 3;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - cloumn * BtnWH) / (cloumn + 1);

    BtnMenuView = [[UIView alloc] init];
    [BtnMenuView setBackgroundColor:[UIColor clearColor]];
    BtnMenuView.frame = CGRectMake(0, Screen_Height - 400, Screen_Width * 2, 200 + margin );
    [self.view addSubview:BtnMenuView];

    [self addBtns];
}

- (void)addBtns{

    int cloumn = 3;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - cloumn * BtnWH) / (cloumn + 1);
    CGFloat x = 0;
    CGFloat y = 0;
    int curCloumn = 0;
    int curRow = 0;
   
    cloumn = 6;
    for (int i = 0; i < _itemArray.count; i++) {
        
        ZXC_Btn *btn = [ZXC_Btn buttonWithType:UIButtonTypeCustom];
        btn.tag = 10000 + i;
        //当前所在列
        curCloumn  = i % cloumn;
        //当前所在行
        curRow = i / cloumn;
        
        if (curRow == 0 && i > 2) {
            
            x = margin + (BtnWH + margin) * curCloumn + margin;
        }else if (curRow == 1 && i > 8){
           x = margin + (BtnWH + margin) * curCloumn + margin;
        }else{
        
            x = margin + (BtnWH + margin) * curCloumn;
        }
        
        y = (BtnWH + margin) *curRow ;
        
        btn.frame = CGRectMake(x, y, BtnWH, BtnWH);
 
        ZXC_Item *item = _itemArray[i];
        
        [BtnMenuView addSubview:btn];
        
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setImage:item.image forState:UIControlStateNormal];
        
        btn.transform = CGAffineTransformMakeTranslation(0, Screen_Height);
        
        [btn addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(scaleOriginal:) forControlEvents:UIControlEventTouchUpInside];
    }

}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        im.transform = CGAffineTransformMakeRotation(M_PI_4);
        //取反
        IsSelected = !IsSelected;
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)singleTapAction:(UIGestureRecognizer *)ges
{
    
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        im.transform = CGAffineTransformIdentity;
            
//        returnBtnIndex = 11;
        
        [self returnTime];
        
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark action
- (void)scale:(UIButton *)btn{
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
    }];
}
- (void)scaleOriginal:(UIButton *)btn{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformIdentity;
    }];
    
    if (btn.tag == 10008) {
        currentPage = 2;
        [UIView animateWithDuration:0.5 animations:^{
            
            BtnMenuView.transform = CGAffineTransformMakeTranslation(-Screen_Width, 0);
            addcurrentPagereturnBtn.alpha = 1;
        }];
    }
}
- (void)Pagereturn{
    
    currentPage = 1;
    [UIView animateWithDuration:0.5 animations:^{
        
        BtnMenuView.transform = CGAffineTransformIdentity;
        addcurrentPagereturnBtn.alpha = 0;
    }];

}

- (void)returnBtn{
    
//    returnBtnIndex = (int)_itemArray.count - 1;

    [self returnTime];
    
}
- (void)hiddenAnimation{
    
    NSLog(@"%s",__func__);
    
    //保护
    if (returnBtnIndex == 0) {
        
        [returnTime invalidate];
        [self dismissModalViewControllerAnimated:YES];
        return;
    }
    ZXC_Btn *btn = [[BtnMenuView subviews] objectAtIndex:returnBtnIndex];
     returnBtnIndex--;
    switch (currentPage) {
        case 1:
        {
            if (btn.tag < 10003 || (btn.tag > 10005 && btn.tag < 10009)) {
                
                [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                
                    im.transform = CGAffineTransformIdentity;
                    btn.transform = CGAffineTransformMakeTranslation(0, Screen_Height);
                    
                } completion:^(BOOL finished) {
                    
                }];
            }
        }
            break;
        case 2:{
            if ((btn.tag > 10002 && btn.tag < 10006) || btn.tag > 10008) {
                
                [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                    
                    btn.transform = CGAffineTransformMakeTranslation(0, Screen_Height);
                } completion:^(BOOL finished) {
                    
                }];
                
            }
        
        }
        default:
            break;
    }
}
@end
