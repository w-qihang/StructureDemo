//
//  APIManager.m
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/8.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "APIManager.h"
#import "AFNetworking.h"

@implementation APIManager

- (instancetype)init {
    self = [super init];
    if ([self conformsToProtocol:@protocol(APIManagerDataSource)]) {
        self.child = (id<APIManagerDataSource>)self;
    } else {
        // 不遵守这个protocol的就让他crash，防止派生类乱来。
        NSAssert(NO, @"子类必须要实现APIManagerProtocol这个protocol");
    }
    return self;
}

- (NSDictionary *)fetchDataWithReformer:(id<ReformerProtocol>)reformer {
    if (reformer == nil) {
        return self.rawData;
    } else {
        NSAssert(![reformer conformsToProtocol:@protocol(ReformerProtocol)], @"reformer必须遵循ReformerProtocol协议");
        return [reformer reformDataWithManager:self];
    }
}

- (void)fetchDataWithParameters:(NSDictionary *)parameters {
    [self requestWithAPIName:[self.child apiMethodName] parameters:parameters];
}

- (void)requestWithAPIName:(NSString *)apiName parameters:(NSDictionary *)parameters {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //后台接口是JSON格式
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //AFNetworking不支持text/html,遇到请求头到错误时修改
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    [manager GET:apiName parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([self.delegate respondsToSelector:@selector(apiManagerDidSuccess:)]) {
            [self.delegate apiManagerDidSuccess:self];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if([self.delegate respondsToSelector:@selector(apiManagerDidFail:)]) {
            [self.delegate apiManagerDidFail:self];
        }
    }];
}

@end
