//
//  WPInfoWebViewController.m
//  MyLibs
//
//  Created by Joey on 2021/7/30.
//
#import <WebKit/WKWebView.h>
#import "WPInfoWebViewController.h"

@interface WPInfoWebViewController ()
@property (strong,nonatomic)WKWebView *wkWebView;
@end

@implementation WPInfoWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:self.wkWebView];
}


@end
