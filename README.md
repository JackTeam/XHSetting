XHSetting
=========

中文：类似微信、QQ、instagram、网易新闻、唱吧、新浪微博、Twitter、系统设置的设置页面  

English: like weChat、 QQ、 instagram、NetEase new、changba、sina weibo、Twitter、system setting a SettingsViewController.


![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/微信.png)
![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/QQ.png)
![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/Instagram.png)
![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/网易新闻.png)
![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/唱吧.png)
![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/新浪微博.png)
![image](https://github.com/JackTeam/XHSetting/raw/master/Screenshots/Twitter.png)


## 例子
## Example
```objective-c

1、继承XHSetting
2、在ViewDidloadl利用如下方法：
添加一个section
- (void)addSection:(XHTableViewControllerAddSectionBlock)b;
- 
在某个section里面添加一个cell
- (void) addCell:(XHTableViewCellBlock)configurationBlock whenSelected:(XHTableViewCellWhenSelectedBlock)whenSelectedBlock;

```

## Thanks

[jakemarsh](https://github.com/jakemarsh)


## License

中文:      XHSetting 是在MIT协议下使用的，可以在LICENSE文件里面找到相关的使用协议信息.

English:   XHSetting is acailable under the MIT license, see the LICENSE file for more information.



=======================
## 须知       
中文：如果您在您的项目中使用开源组件,请给我们发[电子邮件](mailto:xhzengAIB@gmail.com?subject=From%20GitHub%20XHSetting)告诉我们您的应用程序的名称。         

## Instructions
         
English：If you use open source components in your project, please [Email us](mailto:xhzengAIB@gmail.com?subject=From%20GitHub%20XHSetting) to tell us the name of your application.

