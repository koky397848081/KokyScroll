//
//  ViewController.m
//  KokyScroll
//
//  Created by jingjing on 2017/5/1.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import "ViewController.h"
#import "ALTopicDetailViewController.h"
#import "CacheTools.h"

@interface ViewController ()
{

    __weak IBOutlet UIButton *_cacheBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self cacheBtnGetTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[ALTopicDetailViewController alloc]init] animated:YES];
}

//设置缓存按钮title
- (void)cacheBtnGetTitle{
    NSString *cacheSize = [NSString stringWithFormat:@"缓存%.2fM",[CacheTools folderSizeWithPath:[CacheTools getPath]]];
    [_cacheBtn setTitle:cacheSize forState:UIControlStateNormal];
}

//清除缓存
- (IBAction)cacheBtnClick:(UIButton *)sender {
    [CacheTools clearCacheWith:[CacheTools getPath]];
    [self cacheBtnGetTitle];
}


@end
