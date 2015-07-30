//
//  RootViewControllerTwo.m
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-28.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "RootViewControllerTwo.h"

@interface RootViewControllerTwo ()
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) UIView *v1;
@end


@implementation RootViewControllerTwo
@synthesize btn;
@synthesize v1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar:[NSDictionary dictionaryWithObjectsAndKeys:@"第2个", @"topBarTitle", nil]];
    
    v1 = [[UIView alloc] init];
    v1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v1];
    [v1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dic = NSDictionaryOfVariableBindings(v1);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[v1(80)]" options:0 metrics:nil views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[v1(80)]" options:0 metrics:nil views:dic]];
    
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"msg" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    //禁止自动转换AutoresizingMask
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:btn];
    
    //居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    //距离底部20单位
    //注意NSLayoutConstraint创建的constant是加在toItem参数的，所以需要-20。
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-200]];
    
    ////定义高度是父View的三分之一
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0]];
    
    
    //注册kvo
    [btn addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
    
}

- (void)viewDidLayoutSubviews{
    //http://stackoverflow.com/questions/12943107/how-do-i-adjust-the-anchor-point-of-a-calayer-when-auto-layout-is-being-used/14105757#14105757
    //How do I adjust the anchor point of a CALayer, when Auto Layout is being used?
    [super viewDidLayoutSubviews];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    CATransform3D transform = self.btn.layer.transform;
    self.btn.layer.transform = CATransform3DIdentity;
    self.btn.frame = self.v1.bounds;
    self.btn.layer.transform = transform;
    [CATransaction commit];
}


//kvo回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if(object == btn && [keyPath isEqualToString:@"bounds"]){
         [btn setTitle:NSStringFromCGSize(btn.bounds.size) forState:UIControlStateNormal];
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
