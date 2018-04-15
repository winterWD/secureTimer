//
//  ViewController.m
//  demo
//
//  Created by winter on 2018/4/15.
//  Copyright © 2018年 winter. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+Secure.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, assign) NSInteger increaseNum;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _increaseNum = 0;
}

- (void)dealloc {
    NSLog(@"======= ViewController dealloc =======");
    
//    [self.timer invalidate];
//    self.timer = nil;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super didReceiveMemoryWarning];
    
    [self.timer invalidate];
    self.timer = nil;
}

- (IBAction)buttonAvtion:(UIButton *)sender {
    //      self.timer =
    //    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseLabel) userInfo:nil repeats:YES];
    
    self.timer = [NSTimer seScheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseLabel) repeats:YES];
    __weak typeof(self) weakSelf = self;
    [NSTimer seScheduledTimerWithTimeInterval:0.1 target:self block:^{
        [weakSelf increaseLabel];
    }];
}

- (void)increaseLabel {
    _increaseNum++;
    _label.text = [NSString stringWithFormat:@"%ld", _increaseNum];
}
@end
