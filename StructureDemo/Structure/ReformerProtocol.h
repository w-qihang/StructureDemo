//
//  ReformerProtocol.h
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/8.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APIManager;

NS_ASSUME_NONNULL_BEGIN

//此角色相当于ViewModel,用于封装数据转化的逻辑,做数据的标准化输出
@protocol ReformerProtocol <NSObject>

@required
- (NSDictionary *)reformDataWithManager:(APIManager *)manager;

@end

NS_ASSUME_NONNULL_END
