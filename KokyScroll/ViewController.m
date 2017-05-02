//
//  ViewController.m
//  KokyScroll
//
//  Created by jingjing on 2017/5/1.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import "ViewController.h"
#import "ALTopicDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[ALTopicDetailViewController alloc]init] animated:YES];
}


@end
