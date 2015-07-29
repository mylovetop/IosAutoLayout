//
//  ListViewController.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-28.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar:[NSDictionary dictionaryWithObjectsAndKeys:@"列表", @"topBarTitle", nil]];
    UIWebView *webView = [[UIWebView alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:webView];
    
    NSDictionary *dicUI = NSDictionaryOfVariableBindings(webView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[webView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dicUI]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[webView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dicUI]];
    

    
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
