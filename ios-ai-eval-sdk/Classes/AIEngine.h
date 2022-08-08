//
//  AIEngine.h
//
//  Created by xiaodong on 2022/7/5.
//

#import <Foundation/Foundation.h>
#import "AIProcessController.h"
#import "AIEvalRequest.h"
#import "AIEvalResultListener.h"


NS_ASSUME_NONNULL_BEGIN

@interface AIEngine : NSObject

@property (nonatomic) NSString* salt;
@property (nonatomic) NSString* appid;
@property (nonatomic) NSString* secretKey;
@property (nonatomic) NSString* url;
@property (nonatomic) NSString* recPath;
@property (nonatomic) NSString* userID;

@property (nonatomic) AIProcessController* controller;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype) shared;



- (void) create:(NSString*)appid secretKey:(NSString*) secretKey;
- (void) createWithUserID:(NSString*)appid secretKey:(NSString*) secretKey userID:(NSString*) userID;

- (void) start:(AIEvalRequest*) request listener:(AIEvalResultListener*) listener;
- (void) stop;
- (void) cancel;

@end


NS_ASSUME_NONNULL_END

