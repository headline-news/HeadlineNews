//
//  FirstViewController.m
//  FeedsAPP
//
//  Created by student4 on 2019/5/11.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "FirstViewController.h"
#import "MultiTabView.h"

@interface FirstViewController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) MultiTabView *multiTabView;
@property (strong, nonatomic) IBOutlet UIView *superView;
@property (assign) NSInteger numOfTabs;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _numOfTabs = 6;
    self.navigationController.delegate = self;
    [self initSlideWithCount:_numOfTabs];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController setTitle:@"首页"];
    
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isMYself = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isMYself animated:YES];
}

-(void) initSlideWithCount: (NSInteger) count{
    CGRect screenBound = self.view.frame;
    screenBound.origin.y = 50;
    screenBound.size.height -= 50;
    
    _multiTabView = [[MultiTabView alloc] initWithFrame: screenBound WithCount:count];
    _multiTabView.homevc = self;
    
    [self.view addSubview:_multiTabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
