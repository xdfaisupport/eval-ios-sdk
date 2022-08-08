//
//  AIEvalResult.h
//  helloios
//
//  Created by xiaodong on 2022/7/5.
//

#import <Foundation/Foundation.h>
#import "AIEvalResultType.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIEvalResult : NSObject

@property (nonatomic) NSString* text;
@property (nonatomic) AIEvalResultType type;

- (instancetype) initWithText:(NSString*) text resultType:(AIEvalResultType)type;

@end

NS_ASSUME_NONNULL_END
