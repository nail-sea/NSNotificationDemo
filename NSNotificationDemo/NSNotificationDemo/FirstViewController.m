//
//  FirstViewController.m
//  NSNotificationDemo
//
//  Created by Sure on 15-9-19.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dogTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *sexLabel;
- (IBAction)nextClick:(UIButton *)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //实时监听通知，注册通知
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNoti:) name:@"DogNoti" object:nil];
    // Do any additional setup after loading the view from its nib.
}
//参数类型NSNotification
- (void)receiveNoti:(NSNotification*)noti{
    //获取所发送的消息
    NSDictionary * dict = noti.userInfo;
    //加载到Label上
    _nameLabel.text = dict[@"name"];
    _dogTypeLabel.text = dict[@"type"];
    _ageLabel.text = dict[@"age"];
    _sexLabel.text = dict[@"sex"];
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

- (IBAction)nextClick:(UIButton *)sender {
    
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
}
@end
