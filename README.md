QQWalletSDK
===========

Iphone QQ支付能力开放SDK封装。


##一、安装
###1.使用源码
####依赖(在使用需要安装以下工具)：

1. [iOS-Universal-Framework](https://github.com/kstenerud/iOS-Universal-Framework)


####（1）cocoapods

1. 如果不存在Podfile文件通过以下命令创建Podfile文件,如果存在则忽略此步骤  
   ```pod setup```
2.  在Podfile中添加  
   ```
   pod "QQWalletSDK"
   ```
3. 执行   
   ```
   pod install  
   ```  
   之后，变可以在您的工程中使用QQWalletSDK。

####（2）引入工程的方式

1. git clone http://....

2. 将QQWalletSDK工程拖入到您的工程当中，并且设置工程依赖关系：

![image](./Documents/imgs/target_dependence)

3. 链接framework：
![image](./Documents/imgs/link)

###2. 使用framework文件

您可以直接将位于./Framework/QQWalletSDK.framework的库文件链接到您的工程中使用。

##二、使用说明

1. 在您的工程中的plist文件中创建用于回调的URL SCHEMA。此URL SCHEMA用于手机QQ完成功能后，传递结果信息用。请尽量保证此URL SCHEMA不会与其他冲突。  
  ![image](./Documents/imgs/urlschema)
  
2. 在**appDelegate.m中注册您的应用,

   ```

   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
       /**
     *  注册第三方APP信息
     *
     *  @param appId     APP的唯一标识
     *  @param urlScheme APP的URL SCHEME，用户在手机QQ内部完成功能后进行回调
     *  @param name      APP的名字
     */
    [QQWalletSDK registerQQWalletApplication:@"aa.aa" urlScheme:@"com.qqwallet.demo" name:@"Demo"];
    return YES;
}
   ```
   
3. 在函数```- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation``` 中注册回调监听  
  
  ```
  - (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
    {
        if ([QQWalletSDK  QQWalletSDKHanldeApplication:application openURL:url  sourceApplication:sourceApplication annotation:annotation] ) {
        return YES;
    }
    return YES;
 }
  ```
  
##三、功能调用
（1）支付接口
    
    ```
    /**
     *  调起手Q进行支付，参数为从第三方APP从服务器获取的参数，透传到手机QQ内，唤起支付功能
     *
     *  @param params     第三方APP下单后从无武器获取的参数
     *  @param completion 回调的Block
     */
    + (void) startPayWithServerParams:(NSDictionary*)params
                       completion:(QQTaskCompletion)completion;
                       
    ```  
 必须传入的参数：
 
 
| 关键字        | 类型           | 含义 | 程序中使用变量 |
| ------------- |:-------------:| -----:| --------: |
| tokenId     | NSString* | 订单号 |  kQWPayParamTokenID |

可选参数，需要关注公共账号时填入下面两个参数：

| 关键字        | 类型           | 含义 | 程序中使用变量 |
| ------------- |:-------------:| -----:| --------: |
| pubAcc     | NSString* | 需要关注的公共账号唯一标识 |  kQWPayParamPubAccountID |
| pubHint     | NSString* | 关注公共账号的提示语 |  kQWPayParamPubHint |

