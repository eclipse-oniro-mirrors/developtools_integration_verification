/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { FullScreenLaunchComponent, promptAction } from '@kit.ArkUI';


@Entry
@Component
struct SpecialComponentsFullscreenLaunchComponentOptions0010 {
  @State showToast: boolean = false

  aboutToAppear() {
    // 页面加载时显示Toast
    setTimeout(() => {
      promptAction.showToast({
        message: 'FullScreenLaunch组件已加载',
        duration: 2000,
        bottom: 50
      });
    }, 500);
  }

  build() {
    Column() {
      Text('FullScreenLaunchComponent Options传参测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_001')

      Text('测试说明: 测试FullScreenLaunchComponent的options参数')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_002')

      // FullScreenLaunchComponent组件
      FullScreenLaunchComponent({
        appId: 'com.example.atomicservice',
        options: {
          displayId: 0,
          windowMode: 0
        },
        onError: (error) => {
          console.error('[FullScreenLaunchOptions] Error: ' + error.message)
          promptAction.showToast({
            message: '拉起失败: ' + error.message,
            duration: 2000
          });
        },
        onReceive: (data) => {
          console.info('[FullScreenLaunchOptions] Received data: ' + JSON.stringify(data))
          promptAction.showToast({
            message: '接收到数据',
            duration: 2000
          });
        },
        onTerminated: () => {
          console.info('[FullScreenLaunchOptions] Service terminated')
          promptAction.showToast({
            message: '服务已终止',
            duration: 2000
          });
        }
      })
        .width('80%')
        .height(200)
        .margin({ bottom: 30 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_003')

      Divider().margin({ bottom: 20 })

      Text('预期结果:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_004')

      Text('• 页面显示"FullScreenLaunch拉起"字样')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_005')

      Text('• 底部显示Toast提示')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_006')

      Text('• Options参数正确传递')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_007')

      Divider().margin({ top: 20, bottom: 20 })

      Text('Options参数说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_008')

      Text('• appId: com.example.atomicservice')
        .fontSize(11)
        .fontColor('#999999')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_009')

      Text('• displayId: 0 (默认显示屏)')
        .fontSize(11)
        .fontColor('#999999')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_010')

      Text('• windowMode: 0 (全屏模式)')
        .fontSize(11)
        .fontColor('#999999')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_011')

      // 手动触发Toast按钮
      Button('显示Toast提示')
        .width('60%')
        .height(45)
        .margin({ top: 30 })
        .id('SpecialComponentsFullscreenLaunchComponentOptions0010_012')
        .onClick(() => {
          promptAction.showToast({
            message: 'FullScreenLaunch组件测试中',
            duration: 2000,
            bottom: 50
          });
          console.info('[FullScreenLaunchOptions] Manual toast triggered')
        })

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
