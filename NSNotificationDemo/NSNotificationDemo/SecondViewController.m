//
//  SecondViewController.m
//  NSNotificationDemo
//
//  Created by Sure on 15-9-19.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *dogName;
@property (strong, nonatomic) IBOutlet UITextField *dogType;
@property (strong, nonatomic) IBOutlet UITextField *dogAge;
@property (strong, nonatomic) IBOutlet UITextField *dogSex;
- (IBAction)backClick:(UIButton *)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加手势让键盘收回
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDown)];
    
    [self.view addGestureRecognizer:tap];
    
    _dogSex.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
- (void)tapDown{
    [self.view endEditing:YES];//界面中所有的TextField取消第一响应
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //过渡动画
    [UIView animateWithDuration:0.5 animations:^{
        
        self.view.frame = CGRectMake(0, -100, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
    NSLog(@"Editing");
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    //还原
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
    
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

- (IBAction)backClick:(UIButton *)sender {
    //返回同时进行通知传值
    //将所需传递的信息存入字典中
    NSDictionary * dict = @{@"name":_dogName.text,
                            @"type":_dogType.text,
                            @"age":_dogAge.text,
                            @"sex":_dogSex.text};
    
    //1、书写通知
    NSNotification * noti = [NSNotification notificationWithName:@"DogNoti" object:nil userInfo:dict];
    //2、通知中心发送
    [[NSNotificationCenter defaultCenter]postNotification:noti];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
