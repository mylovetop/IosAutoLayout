//
//  RootViewControllerThree.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-28.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "RootViewControllerThree.h"

@interface RootViewControllerThree ()

@end

@implementation RootViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar:[NSDictionary dictionaryWithObjectsAndKeys:@"第3个", @"topBarTitle", nil]];
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

@end
