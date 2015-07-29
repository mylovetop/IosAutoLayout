//
//  BaseViewController.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-27.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (strong, nonatomic) UILabel *_topBarTitle;
@property (strong, nonatomic) UIButton *_topBarLeftBtn;
@property (strong, nonatomic) UIButton *_topBarRightBtn;
@end

@implementation BaseViewController

@synthesize _topBarTitle;
@synthesize _topBarLeftBtn;
@synthesize _topBarRightBtn;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建头部导航栏
    [self createTopBar];

}

- (void)createTopBar{
    UIView *topBar = [[UIView alloc] init];
    [topBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [topBar setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topBar];
    
    _topBarTitle = [[UILabel alloc] init];
    [_topBarTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_topBarTitle setText:@"头部标题"];
    [topBar addSubview:_topBarTitle];
    
    
    _topBarLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_topBarLeftBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_topBarLeftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_topBarLeftBtn addTarget:self action:@selector(onClickTopBarLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:_topBarLeftBtn];

    
    
    NSDictionary *dic = NSDictionaryOfVariableBindings(topBar, _topBarTitle, _topBarLeftBtn);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[topBar]-0-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[topBar(50)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
//
    [topBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[_topBarTitle]" options:0 metrics:nil views:dic]];
//            [topBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[topTitle]" options:0 metrics:nil views:dic]];
    [topBar addConstraint:[NSLayoutConstraint constraintWithItem:_topBarTitle
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:topBar
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:0]];
    [topBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[_topBarLeftBtn(50)]"
                                                                  options:0 metrics:nil views:dic]];
    [topBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-18-[_topBarLeftBtn]"
                                                                   options:0 metrics:nil views:dic]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initTopBar:(NSDictionary *)dic{
    [self._topBarTitle setText:[dic objectForKey:@"topBarTitle"]];
    
    //左侧按钮
    id leftBtn = (id)[dic objectForKey:@"hideTopBarLeftBtn"];
    if (leftBtn != nil) {
        [self._topBarLeftBtn setHidden:YES];
    }
    
    
}

- (void) onClickTopBarLeftBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
