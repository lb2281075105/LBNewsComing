# LBNewsComing

今天分享了[ReactNative 仿美团项目](http://www.jianshu.com/p/8ab88851c252)，浏览量增加，尽管没有得到更多的喜欢，但是这也激励了我，我把之前做的[Github--iOS仿新闻项目](https://github.com/lb2281075105/LBNewsComing.git)也分享出来，源码放在Github上面了，简书请移步[简书--iOS仿新闻项目](http://www.jianshu.com/p/5a1b2e2bcf10)希望得到大家的喜欢，多多star哦。

iOS仿新闻项目共分为四个模块，分别是新闻来了、图文、视频以及我的四个模块，新闻项目用到了一些框架，会在项目简单介绍中一一列出来，整个项目用了MVVM架构模式，更加适合有经验和初学者学习，接下来简单介绍下项目的组成。

一、项目的结构设计

1、首页展示模块

![主页.png](http://upload-images.jianshu.io/upload_images/3276082-226dc44e8c848cdc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
主页主要有滑动的标题、轮播图以及列表组成，布局很简单实现，也已经封装在代码中了，详细请看源码。
2、图文模块
![段子.png](http://upload-images.jianshu.io/upload_images/3276082-04ed73463471eaa9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![语音读段子.png](http://upload-images.jianshu.io/upload_images/3276082-b1df64a0c94045a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![图片.png](http://upload-images.jianshu.io/upload_images/3276082-236ac4f4fd565dcd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3、视频模块
![视频.png](http://upload-images.jianshu.io/upload_images/3276082-e83bbc5a460c7fd6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4、我的模块
![我的.png](http://upload-images.jianshu.io/upload_images/3276082-504580259740f7be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

二、项目所用到的框架

下面列举下项目中用到的框架，怎么使用可以到Github上面搜索使用
```
target 'LBNewsComing' do
pod 'WMPageController', '~> 1.8.0'
pod 'AFNetworking', '~> 3.1.0'
pod 'MBProgressHUD', '~> 0.9'
pod 'MJExtension', '~> 3.0.13'
pod 'MJRefresh', '~> 3.1.12'
pod 'Masonry', '~> 1.0.1'
pod 'SDWebImage', '~> 3.8.1'
pod 'SDCycleScrollView'
pod 'BlocksKit', '~> 2.2.5'
pod 'MWPhotoBrowser', '~> 2.1.0'
pod 'BmobSDK', '~> 1.7.2'
end
```
项目目录
![项目目录.png](http://upload-images.jianshu.io/upload_images/3276082-0e3162bb2759b36b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

三、项目心得体会

项目很简单，思想不用多说，主要是MVVM设计模式，如果想更加清楚项目结构，请看源代码[iOS仿新闻项目](https://github.com/lb2281075105/LBNewsComing.git)，层次清晰，阅读起来很方便，遇到什么疑惑和困难，可以在下面评论，我看会会及时回复的issues me哦。

iOS仿新闻项目主要是练习MVVM设计模式，通过学习学习到了很多，也把这个项目分享出来，和大家一起学习，项目源码可以点击链接[iOS仿新闻项目](https://github.com/lb2281075105/LBNewsComing.git)获取，如果有不妥的地方，欢迎提建议的小伙伴，合理我会及时修正，还是那句话，实战会使自己学习的更多，因为项目中有很多细节需要处理，我感觉作为程序员能力是一方面，细心也是很重要的，细节决定成败嘛，哈哈哈，还是很开心，把开源项目分享给大家一起学习，喜欢就留下Star，谢谢您。

[我的简书](http://www.jianshu.com/u/23e8548ff67f)也会不断更文，目的是督促自己学习，另一方面分享给大家，共享、共勉。


