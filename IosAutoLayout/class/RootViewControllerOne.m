//
//  ViewController.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-24.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "RootViewControllerOne.h"
#import "ListViewController.h"

@interface RootViewControllerOne ()

@end

@implementation RootViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTopBar:[NSDictionary dictionaryWithObjectsAndKeys:
                      @"第一个", @"topBarTitle",
                      @"yes", @"hideTopBarLeftBtn", nil]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSDictionary *dic = NSDictionaryOfVariableBindings(btn);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[btn]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClick:(id)sender{
    NSLog(@"onclick -----");
    self.hidesBottomBarWhenPushed = YES;
    ListViewController *list = [[ListViewController alloc] init];
    [self.navigationController pushViewController:list animated:YES];
    self.hidesBottomBarWhenPushed = NO;



}

@end
