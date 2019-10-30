//
//  APIManager.h
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/8.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReformerProtocol.h"

/*
 采用离散型API方式调用:一个API对应一个类,这个APIManager只需要提供参数就能起飞,API名字,着陆方式都已经集成入APIManager中.
 相比于集约型优势:当请求在外面飞着的时候,根据不同业务需求存在两种不同需求:一个是取消新发起的请求,等待外面的请求着陆,比如刷新页面的请求;另一个是取消外面飞着的请求,让新发起的请求起飞,比如列表多维度的筛选.如果是集约化的API调用方式要满足这样的需求,每次调用都要多写一部分判断和取消的代码.
 */

NS_ASSUME_NONNULL_BEGIN

@protocol APIManagerDataSource <NSObject>

//APIManager派生类必须实现
@required
- (NSString *)apiMethodName;

@end

//Controller遵循此协议,获取数据
@class APIManager;
@protocol APIManagerDelegate <NSObject>

- (void)apiManagerDidSuccess:(APIManager *)manager;
- (void)apiManagerDidFail:(APIManager *)manager;

@end

//此角色相当于Model,负责提供数据,一个API对应于一个APIManager，然后这个APIManager只需要提供参数就能起飞,可取消，API名字、着陆方式都已经集成入APIManager中
@interface APIManager : NSObject

@property (nonatomic, weak) id<APIManagerDataSource> child;
@property (nonatomic, strong) NSDictionary *rawData;
@property (nonatomic, weak) id<APIManagerDelegate> delegate;

- (NSDictionary *)fetchDataWithReformer:(id<ReformerProtocol>)reformer;
- (void)fetchDataWithParameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
