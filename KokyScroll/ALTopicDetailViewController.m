//
//  ALTopicDetailViewController.m
//  ALApp
//
//  Created by Tywin on 16/8/16.
//  Copyright © 2016年 AiLi. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ALTopicDetailViewController.h"
#import "ALSpaceZoneArticleTableViewCell.h"
#import <SDAutoLayout.h>

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH_Flexible(X) ( X/375.0*SCREEN_WIDTH)
#define SCREEN_HEIGHT_Flexible(X) ( X/667.0*SCREEN_HEIGHT)

@interface ALTopicDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UILabel *titleStringL;
    
    __weak IBOutlet UITableView *_mainTableView;
    IBOutlet UIView             *_headerView;
    __weak IBOutlet UILabel     *_infoCountLabel;
    UIImageView                 *_mainImageView;
    UIView                      *_headerImageView;
    UIImageView                 *_titleBgView;
    UILabel                     *_titleLabel;
    UILabel                     *_contentLabel;
    UILabel                     *_infoCountL;
    NSString                    *_contentString;
    __weak IBOutlet UIButton    *_backBtn;
    CGFloat                     _titleLabelOrigionY;
    
}
@property (weak, nonatomic) IBOutlet UIView *topBarView;


@end

@implementation ALTopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.topBarView.alpha = 0;
    
    [_mainTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"ALTopicDetailHeader"];
    [self setupHeaderView];
    
    
    _mainTableView.hidden = YES;
    _headerImageView.hidden = YES;
    _titleLabel.hidden = YES;
    
    _mainTableView.hidden = NO;
    [self refreshView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 0;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupHeaderView
{
    _headerImageView = [[UIView alloc] init];
    
    _mainImageView = [[UIImageView alloc] init];
    _mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    _mainImageView.clipsToBounds = YES;
    _titleLabel = [[UILabel alloc] init];
    _contentLabel = [[UILabel alloc] init];
    _infoCountL = [[UILabel alloc] init];
    
    _infoCountL.textColor =[UIColor lightGrayColor];//ColorWithOne(153.0);
    
    _infoCountL.font = [UIFont systemFontOfSize:13 ];//Font_Num(13);
    _infoCountL.textAlignment = NSTextAlignmentCenter;
    _infoCountL.backgroundColor = [UIColor whiteColor];
    _infoCountL.layer.cornerRadius = 5;
    _infoCountL.clipsToBounds = YES;
    
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:24 ];//Font_Num(24);
    _titleLabel.numberOfLines = 2;
    // 保持有行间距
    _contentLabel.numberOfLines = 4;
    // 保持有行间距
    
    _titleBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shade_topic"]];
    _titleBgView.backgroundColor = [UIColor clearColor];
    [_headerImageView addSubview:_mainImageView];
    [_headerImageView addSubview:_titleBgView];
    [_headerImageView addSubview:_contentLabel];
    [_headerImageView addSubview:_infoCountL];
    [self.view addSubview:_titleLabel];
    [self.view addSubview:_headerImageView];
    
    _mainImageView.sd_layout.topSpaceToView(_headerImageView,0).leftSpaceToView(_headerImageView,0).rightSpaceToView(_headerImageView,0).bottomEqualToView(_headerImageView);
    
    _headerImageView.sd_layout.topSpaceToView(self.view,0).rightSpaceToView(self.view,0).leftSpaceToView(self.view,0).heightIs(SCREEN_HEIGHT);
    _titleBgView.sd_layout.topSpaceToView(_headerImageView,0).rightSpaceToView(_headerImageView,-5).leftSpaceToView(_headerImageView,0).bottomSpaceToView(_headerImageView,0);
    [self.view bringSubviewToFront:_titleLabel];
    [self.view bringSubviewToFront:_mainTableView];
    [self.view bringSubviewToFront:_backBtn];
    
    
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    tableHeaderView.backgroundColor = [UIColor clearColor];
    _mainTableView.tableHeaderView = tableHeaderView;
    _mainTableView.backgroundColor = [UIColor clearColor];
}

- (void)refreshView
{
    
    _mainTableView.hidden = NO;
    _headerImageView.hidden = NO;
    _titleLabel.hidden = NO;
    _titleLabel.text = @"达摩洞瑟";//
    titleStringL.text = _titleLabel.text;
    
    NSString *content = @"电风扇地方就送俄今年卡特人；老婆IP辱骂俄出门 v 分";// _viewModel.detailDto.topic.content;
    
    
    _mainImageView.image = [UIImage imageNamed:@"img"];
    _infoCountL.text = [NSString stringWithFormat:@"共12篇媒体"/*,_viewModel.detailDto.count.intValue*/];
    _contentLabel.text = content;
    _contentLabel.sd_layout.topSpaceToView(_mainImageView,10).leftSpaceToView(_headerImageView,10).rightSpaceToView(_headerImageView,10).autoHeightRatio(0).bottomSpaceToView(_headerImageView,70);
    
    _infoCountL.sd_layout.leftSpaceToView(_headerImageView,10).heightIs(SCREEN_HEIGHT_Flexible(25)).bottomSpaceToView(_contentLabel,8).widthIs(SCREEN_WIDTH_Flexible(110));
    
    
    _titleLabel.sd_layout.leftSpaceToView(self.view,10).bottomSpaceToView(_infoCountL,10).heightIs(SCREEN_WIDTH * 0.16f).rightSpaceToView(self.view,10);
    
    [_headerImageView layoutSubviews];
    
    
    [UIView animateWithDuration:0.1f animations:^{
        [_mainTableView reloadData];
    }completion:^(BOOL finished) {
        //if (_viewModel.page == 1) {
        _titleLabelOrigionY = _titleLabel.origin.y;
        //  }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate,UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"ALSpaceZoneArticleTableViewCell";
    ALSpaceZoneArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        
        [tableView registerNib:[UINib nibWithNibName:@"ALSpaceZoneArticleTableViewCell" bundle:nil] forCellReuseIdentifier:@"ALSpaceZoneArticleTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ALSpaceZoneArticleTableViewCell"];
    }
    // cell.infoSumaryDto = _viewModel.dataArray[indexPath.row];
    cell.upCountL.hidden  = NO;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;//_viewModel.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ALTopicDetailHeader"];
    if (![header viewWithTag:1201]) {
        [header addSubview:_headerView];
        _headerView.tag = 1201;
        _headerView.sd_layout.topSpaceToView(header,0).leftSpaceToView(header,0).rightSpaceToView(header,0).bottomSpaceToView(header,0);
        
    }
    _infoCountLabel.text = [NSString stringWithFormat:@"共12篇媒体"/*,_viewModel.detailDto.count.intValue*/];
    return header;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset=scrollView.contentOffset.y;
    
    //  ALog(@"--------->%f",offset);
    
    if (offset > 0) {
        CGRect titleLabelFrame = _titleLabel.frame;
        if (offset < SCREEN_HEIGHT - 210) {
            
            _headerImageView.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(SCREEN_HEIGHT - offset + offset/3);
            
            titleLabelFrame.origin.y = _titleLabelOrigionY - offset + offset/3;
            _titleLabel.frame = titleLabelFrame;
            CGFloat alpha = ((SCREEN_HEIGHT - 64)-offset)/(SCREEN_HEIGHT - 64);
            _contentLabel.alpha = alpha;
            _infoCountL.alpha = alpha;
        }else{
            
            CGFloat alpha = ((SCREEN_HEIGHT - 64)-offset)/(SCREEN_HEIGHT - 64);
            _contentLabel.alpha = alpha;
            _infoCountL.alpha = alpha;
        }
        
        if (offset  > SCREEN_HEIGHT - 64) {
            [self.view bringSubviewToFront:self.topBarView];
            
            [UIView animateWithDuration:0.2 animations:^{
                
                self.topBarView.alpha = 1;
                _headerImageView.alpha = 0;
                self.navigationController.title = _titleLabel.text;
            }];
        }else{
            [UIView animateWithDuration:0.2 animations:^{
                _headerImageView.alpha = 1;
                self.topBarView.alpha = 0;
            }];
        }
        
    }else{
        _headerImageView.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(SCREEN_HEIGHT);
    }
}

@end
