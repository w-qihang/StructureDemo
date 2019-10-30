//
//  ViewController.m
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/8.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ViewController.h"
#import "ItemListModel.h"
#import "ItemListViewModel.h"

/*
 采用MVVM,在Controller里面组织了Model,View,ViewModel
 */

@interface ViewController () <APIManagerDelegate>

@property (nonatomic, strong) ItemListModel *itemListModel;
@property (nonatomic, strong) id<ReformerProtocol> xxxReformer;
@property (nonatomic, strong) id<ReformerProtocol> yyyReformer;
@property (nonatomic, strong) UIView *xxxView;
@property (nonatomic, strong) UIView *yyyView;
@property (nonatomic, strong) UIView *zzzView;

@end

@implementation ViewController

//在viewDidload里面只做addSubview的事情
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.xxxView];
    [self.view addSubview:self.yyyView];
    [self.view addSubview:self.zzzView];
}

//在viewWillAppear里面做布局的事情
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.xxxView.frame = CGRectMake(0, 0, 0, 0);
    self.yyyView.frame = CGRectMake(0, 0, 0, 0);
    self.zzzView.frame = CGRectMake(0, 0, 0, 0);
}

//最后在viewDidAppear里面做Notification的监听之类的事情
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

#pragma mark - APIManagerDelegate
- (void)apiManagerDidSuccess:(APIManager *)manager
{
    NSDictionary *reformedXXXData = [manager fetchDataWithReformer:self.xxxReformer];
    NSDictionary *reformedYYYData = [manager fetchDataWithReformer:self.yyyReformer];
    /*
     配置视图,将view和viewModel进行绑定
     [self.xxxView configWithData:reformedXXXData];
     [self.yyyView configWithData:reformedYYYData];
     */
}
- (void)apiManagerDidFail:(APIManager *)manager {
    
}

#pragma mark - Events
- (void)click:(id)sender {
    
}

//getter和setter全部都放在最后
- (UIView *)xxxView {
    return [[UIView alloc]init];
}

- (UIView *)yyyView {
    return [[UIView alloc]init];
}

//也是网络请求APIManager
- (ItemListModel *)itemListModel {
    if(!_itemListModel) {
        _itemListModel = [[ItemListModel alloc]init];
        _itemListModel.delegate = self;
    }
    return _itemListModel;
}

- (id<ReformerProtocol>)xxxReformer {
    if(!_xxxReformer) {
        _xxxReformer = [[ItemListViewModel alloc]init];
    }
    return _xxxReformer;
}

- (id<ReformerProtocol>)yyyReformer {
    if(!_yyyReformer) {
        _yyyReformer = [[ItemListViewModel alloc]init];
    }
    return _yyyReformer;
}

@end
