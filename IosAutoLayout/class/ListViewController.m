//
//  ListViewController.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-28.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "ListViewController.h"
#import "ZipArchive.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar:[NSDictionary dictionaryWithObjectsAndKeys:@"列表", @"topBarTitle", nil]];
    UIWebView *webView = [[UIWebView alloc] init];
    NSString *fileUrl = @"http://nqdeng.github.io/7-days-nodejs/#2.2";//@"http://www.baidu.com";
    
    
    //使用c语言函数NSSearchPathForDirectoriesInDomains来获取沙盒中目录的全路径
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *ourDocumentPath = [documentPaths objectAtIndex:0];
    NSString *sandBoxPath = NSHomeDirectory();
    NSString *documentPath = [sandBoxPath stringByAppendingPathComponent:@""];
    NSString *_fileName = @"h6.html";//@"h5.html";
    //将Documents添加到sandbox路径上//IosAutoLayout.app
    NSString *FileName=[documentPath stringByAppendingPathComponent:_fileName];//fileName就是保存文件的文件名
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // Copy the database sql file from the resourcepath to the documentpath
    NSURL *url;
    if ([fileManager fileExistsAtPath:FileName])
    {
        url = [NSURL URLWithString:FileName];
    }else
    {
        url = [NSURL URLWithString:fileUrl];

        NSData *data = [NSData dataWithContentsOfURL:url];
        [data writeToFile:FileName atomically:YES];//将NSData类型对象data写入文件，文件名为FileName
        
    }
 
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
//zip解决
- (void)OpenZip:(NSString*)zipPath  unzipto:(NSString*)_unzipto
{
    //http://code.google.com/p/ziparchive/
    //http://download.csdn.net/download/u013127097/6889295
    ZipArchive* zip = [[ZipArchive alloc] init];
    if( [zip UnzipOpenFile:zipPath] )
    {
        BOOL ret = [zip UnzipFileTo:_unzipto overWrite:YES];
        if( NO==ret )
        {
            NSLog(@"error");
        }
        [zip UnzipCloseFile];
    }

    
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
