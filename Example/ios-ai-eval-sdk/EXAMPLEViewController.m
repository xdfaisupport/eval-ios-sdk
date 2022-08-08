//
//  EXAMPLEViewController.m
//  ios-ai-eval-sdk
//
//

#import "EXAMPLEViewController.h"
#import "AIEngine.h"
#import "AIEvalRequest.h"
#import "AIEvalRequest.h"
#import "AICoreType.h"


static NSString* recPath1;
static AICoreType coreType=AICoreSentence;

@implementation EXAMPLEViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    

    

    
    
    
    [self.view addSubview:({
        UITextView *label1  = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 400, 400)];
        label1.tag = @"evalResult";
        //label1.numberOfLines = 0;
        //label1.lineBreakMode = NSLineBreakByWordWrapping;
        label1.textAlignment = NSTextAlignmentLeft;
        label1.editable = NO;
        label1.backgroundColor = [UIColor whiteColor];
        label1.textColor = [UIColor blackColor];
        label1;
    })];
    
    
    UILabel *label1  = [[UILabel alloc] initWithFrame:CGRectMake(40, 400, 200, 40)];
    label1.tag = @"selectedCoreType";
    label1.textColor = [UIColor redColor];
    [self.view addSubview:label1];
    
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 460, 40, 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"音素" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(selectPhone)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(80, 460, 40, 40)];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:@"单词" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(selectWord)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(120, 460, 40, 40)];
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:@"句子" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(selectSentence)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(160, 460, 40, 40)];
        button.backgroundColor = [UIColor greenColor];
        [button setTitle:@"段落" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(selectPara)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    
    [self selectWord];
    
    [self.view addSubview:({
        UITextField *field = [[UITextField alloc] init];
        field.tag = @"duration";
        field.frame = CGRectMake(40, 500, 400, 40);
        field.placeholder = @"输入录音时间单位秒，默认3秒";
        field.borderStyle = UITextBorderStyleRoundedRect;
        field;
    })];
    
    [self.view addSubview:({
        UITextView *field = [[UITextView alloc] init];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:field action:@selector(selectAll:)];
        [field addGestureRecognizer:longPress];
        
        field.tag = @"recText";
        field.frame = CGRectMake(40, 540, 400, 80);
        field.text=@"Apple";
        field.keyboardType = UIKeyboardAppearanceDefault;
        field;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 630, 40, 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"start" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(start)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(80, 630, 40, 40)];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:@"stop" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(stop)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(120, 630, 60, 40)];
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:@"cancel" forState:UIControlStateNormal];
        [button addTarget:self
                action:@selector(cancel)
                forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    
    
    

    
    NSString* recPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"record.wav"];
    
    [[AIEngine shared] create:@"spfqUbjFxgbhRQhr"
                             secretKey:@"ng9uy49e_qE0lPiVE_QYydXz2iM7zdbqCLzM"];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[self.view viewWithTag:@"recText"] resignFirstResponder];
    [[self.view viewWithTag:@"duration"] resignFirstResponder];
}

- (void)selectPhone{
    coreType = AICorePhone;
    [self updateCoreTypeText:coreType];
}

- (void) selectWord{
    coreType = AICoreWord;
    [self updateCoreTypeText:coreType];

}

- (void) selectSentence{
    coreType = AICoreSentence;
    [self updateCoreTypeText:coreType];

}

-(void) selectPara{
    coreType = AICoreParagraph;
    [self updateCoreTypeText:coreType];
}

-(void)updateCoreTypeText:(AICoreType) type{
    UILabel *label = [self.view viewWithTag:@"selectedCoreType"];
    if(type == AICorePhone){
        label.text=@"测评类型：音素";
    }else if(type == AICoreWord){
        label.text=@"测评类型：单词";
    }else if(type == AICoreSentence){
        label.text=@"测评类型：句子";
    }else{
        label.text=@"测评类型：段落";
    }
}


- (void)start{
    
    UITextField *duration = [self.view viewWithTag:@"duration"];
    int dur = 3000;
    NSString* durText = [[duration text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([durText length] != 0){
        dur = [durText intValue]*1000;
    }
    
    NSLog(@"duration is %d", dur);
    
    UITextView *recTextView = [self.view viewWithTag:@"recText"];
    NSString* recText = [[recTextView text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    recText = [recTextView text];
    
    AIEvalRequest* request = [[AIEvalRequest alloc] initWithRefText:recText
                                                       coreType:coreType
                                                    recDuration:dur];
    
    
    UITextView *label = [self.view viewWithTag:@"evalResult"];
    label.text = [request description];
    [label insertText:@"\n\n"];
    
    AIEvalResultListener* listener = [[AIEvalResultListener alloc] init];
    listener.onEvalResult = ^(AIEvalResult * _Nonnull result) {
//        UILabel *label = [self.view viewWithTag:@"evalResult"];
//        CGSize size = [result.text sizeWithFont:label.font constrainedToSize:CGSizeMake(300, FLT_MAX) lineBreakMode:label.lineBreakMode];
//        CGRect rect = label.frame;
//        rect.size.height = size.height;
//        label.frame = rect;
        
        UITextView *label = [self.view viewWithTag:@"evalResult"];
        [label insertText:result.text];
        
    };
    listener.onError = ^(NSError * _Nonnull error) {
        UITextView *label = [self.view viewWithTag:@"evalResult"];
        label.text = [error localizedDescription];

    };
    [[AIEngine shared] start:request listener:listener];
}

- (void)stop{
    [[AIEngine shared] stop];
}

- (void)cancel{
    [[AIEngine shared] cancel];
}


- (void)selectAll:(id)sender{
    UIMenuController *controller = [UIMenuController sharedMenuController];
    [[self.view viewWithTag:@"recText"] selectAll:controller];
}

@end
