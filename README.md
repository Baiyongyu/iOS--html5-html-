# iOS--html5-html-
iOS-加载html5调用html方法修改内容

在iOS中操作html5的几个步骤:
- 利用webView控件加载本地html5或者网络上html5;
- 设置当前控制器对象为webView的代理的代理对象,并遵守协议；
- 用类选择器或者id选择器或者标签选择器等选择要进行操作的标签；
- 把获取到的标签转换成字符串；
- webView调用stringByEvaluatingJavaScriptFromString方法去执行js代码；

####需要加载的html文件
![html](http://upload-images.jianshu.io/upload_images/5684426-7878eec85e3d874b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###一、加载本地的html文件
```
NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
self.webView.delegate = self;
[self.webView loadRequest:request];
```
运行展示的初始效果：
![运行html](http://upload-images.jianshu.io/upload_images/5684426-816ecbff19f76507.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###二、实现代理方法webViewDidFinishLoad:来操作网页
-  删除 。 （获取id为“company”的标签，删除）
```
    NSString *comStr = @"var p = document.getElementById('company')";
    NSString *removeStr = @"p.remove()";
    [webView stringByEvaluatingJavaScriptFromString:comStr];
    [webView stringByEvaluatingJavaScriptFromString:removeStr];
```
删除之后的效果：
![删除之后的效果](http://upload-images.jianshu.io/upload_images/5684426-662258e4978bf1bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 更改  (修改列表里面的内容)
```
    NSString *updateStr = @"var yx = document.getElementsByClassName('yx')[0];""yx.innerHTML = '我想去大公司';";
    [webView stringByEvaluatingJavaScriptFromString:updateStr];
```
更改之后的效果：
![更改之后的效果](http://upload-images.jianshu.io/upload_images/5684426-ad9677c322b1cdba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 插入  (在界面中插入一张图片)
```
    NSString *insrtImage = @"var img = document.createElement('img');"
                            "img.src = 'ic_weather_bg.png';"
                            "img.width = '300';"
                            "img.height = '150';"
                            "document.body.appendChild(img);";
    [webView stringByEvaluatingJavaScriptFromString:insrtImage];
```
插入图片之后的效果：

![插入图片之后的效果](http://upload-images.jianshu.io/upload_images/5684426-40be1a30b4841342.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 修改html5里的字体大小、字体颜色、背景色
```
    //字体大小
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust = '130%'"];
    //字体颜色
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor = 'red'"];
    //修改背景yanse
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background = 'yellow'"];
```

![修改html5里的字体大小、字体颜色、背景色](http://upload-images.jianshu.io/upload_images/5684426-5d2cbafd2593e3fa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

至此，几个简单的方法介绍完了，感谢： https://sanwen8.cn/p/105vROg.html 的分享！
