//
//  AIEvalResultListener.h
//  helloios
//
//  Created by xiaodong on 2022/7/8.
//

#import <Foundation/Foundation.h>
#import "AIEvalResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIEvalResultListener : NSObject
@property (nonatomic) void (^onEvalResult)(AIEvalResult* result);
@property (nonatomic) void (^onError)(NSError* error);
@end

NS_ASSUME_NONNULL_END
