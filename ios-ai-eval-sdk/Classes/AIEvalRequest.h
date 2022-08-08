//
//  AIEvalRequest.h
//  helloios
//
//  Created by xiaodong on 2022/7/5.
//

#import <Foundation/Foundation.h>
#import "AICoreType.h"

NS_ASSUME_NONNULL_BEGIN

@interface AIEvalRequest : NSObject


@property (nonatomic) NSString* refText;
@property (nonatomic) AICoreType coreType;
@property (nonatomic) NSString* coreTypeStr;
@property (nonatomic) NSInteger recDuration;
@property (nonatomic) NSString* audioType;
@property (nonatomic) NSString* soundIntensityEnable;
@property (nonatomic) NSString* compress;
@property (nonatomic) int ext_word_details;
@property (nonatomic) NSString* coreProvideType;
@property (nonatomic) NSString* userId;







- (instancetype) initWithRefText:(NSString *)refText coreType:(AICoreType)coreType recDuration:(NSInteger) recduration;

@end

NS_ASSUME_NONNULL_END
