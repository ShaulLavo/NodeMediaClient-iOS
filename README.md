# NodeMediaClient

A simple, high-performance, low-latency live streaming SDK.

# Cocoapods 安装

## 创建 Podfile 文件

```ruby
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'QLive' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_modular_headers!

  # Pods for QLive
  pod 'NodeMediaClient', '~> 2.9.8'
end
```

Then run a **pod install** inside your terminal, or from CocoaPods.app.

## Play Live Streaming

### 1. import header

```
#import "ViewController.h"
#import <NodeMediaClient/NodeMediaClient.h>
#import <AVFoundation/AVFoundation.h>
```

### 2. define object

```
@interface ViewController ()
@property (nonatomic, strong) NodePlayer *np;
@end
```

### 3.Play the stream

```
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _np = [[NodePlayer alloc] init];
    [_np attachView:self.view];
    [_np setScaleMode:1];
    [_np start:@"rtmp://192.168.0.2/live/demo"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_np stop];
    [_np detachView];
}
@end
```

## Publish Live Streaming

### 1. Request more permissions

Please confirm that the description of the 'Privacy - Microphone Usage Description' and the 'Privacy - Camera Usage Description' is added in info.plist .

### 2. Import header

```
#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <NodeMediaClient/NodeMediaClient.h>
```

### 3. Define object

```
@interface ViewController ()
@property (nonatomic, strong) NodePublisher *np;
@end
```

### 4.Start Publish

```
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _np = [[NodePublisher alloc] init];
    [_np attachView:self.view];
    [_np setAudioParamWithCodec:NMC_CODEC_ID_AAC profile:NMC_PROFILE_AUTO samplerate:48000 channels:2 bitrate:64*1000];
    [_np setVideoOrientation:VIDEO_ORIENTATION_PORTRAIT];
    [_np setVideoParamWithCodec:NMC_CODEC_ID_H264 profile:NMC_PROFILE_AUTO width:480 height:854 fps:30 bitrate:1000*1000];
    [_np openCamera:true];
    [_np start:@"rtmp://192.168.0.2/live/demo"];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [_np stop];
    [_np closeCamera];
    [_np detachView];
}
@end
```

## Demo

[https://cdn.nodemedia.cn/NodeMediaClient/NodeMediaClient-iOSDemo.zip](https://cdn.nodemedia.cn/NodeMediaClient/NodeMediaClient-iOSDemo.zip)

## License

A commercial license is required.  
[https://www.nodemedia.cn/product/nodemediaclient-iOS/](https://www.nodemedia.cn/product/nodemediaclient-iOS/)

## Business & Technical service

- QQ: 281269007
- Email: service@nodemedia.cn
