//
//  ViewController.m
//  iOS-加载html5调用html方法修改内容
//
//  Created by 宇玄丶 on 2017/5/10.
//  Copyright © 2017年 北京116科技有限公司. All rights reserved.
//


//在iOS中操作html5的几个步骤:
//
//1.利用webView控件加载本地html5或者网络上html5;
//
//2.设置当前控制器对象为webView的代理的代理对象,并遵守协议；
//
//3.用类选择器或者id选择器或者标签选择器等选择要进行操作的标签；
//
//4.把获取到的标签转换成字符串；
//
//5.webView调用stringByEvaluatingJavaScriptFromString方法去执行js代码；


#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // index.html中，设置内容的距离屏幕的边距，div { margin-left:80px; margin-top:100px;}可以自行修改
    // 1> 删除 。 （获取id为“company”的标签，删除）
    NSString *comStr = @"var p = document.getElementById('company')";
    NSString *removeStr = @"p.remove()";
    [webView stringByEvaluatingJavaScriptFromString:comStr];
    [webView stringByEvaluatingJavaScriptFromString:removeStr];
    
    // 2>更改  (修改列表里面的内容)
    NSString *updateStr = @"var yx = document.getElementsByClassName('yx')[0];""yx.innerHTML = '我想去大公司';";
    [webView stringByEvaluatingJavaScriptFromString:updateStr];
    
    // 3>插入  (在界面中插入一张图片)
    NSString *insrtImage = @"var img = document.createElement('img');"
                            "img.src = 'ic_weather_bg.png';"
                            "img.width = '300';"
                            "img.height = '150';"
                            "document.body.appendChild(img);";
    [webView stringByEvaluatingJavaScriptFromString:insrtImage];
    
    
    //修改html5里的字体大小、字体颜色、背景色
    //字体大小
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust = '130%'"];
    //字体颜色
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor = 'red'"];
    //修改背景yanse
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background = 'yellow'"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
