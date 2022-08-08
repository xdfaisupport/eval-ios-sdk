//
//  EXAMPLEViewController.h
//  ios-ai-eval-sdk
//
//

@import UIKit;

#import "SocketRocket.h"
#import "AIEvalResultListener.h"


@interface EXAMPLEViewController : UIViewController

@property (strong, nonatomic) SRWebSocket *socket;
@property (strong, nonatomic) AIEvalResultListener* listener;

@end
