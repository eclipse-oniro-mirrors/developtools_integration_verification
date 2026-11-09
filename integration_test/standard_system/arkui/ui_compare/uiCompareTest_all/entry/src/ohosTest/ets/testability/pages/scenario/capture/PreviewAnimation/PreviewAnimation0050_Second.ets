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

import { router } from '@kit.ArkUI';

@Entry
@Component
struct PreviewAnimation0050Second {
  @State message: string = '第二个页面'

  // 页面转场效果
  pageTransition() {
    PageTransitionEnter({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Right)
    
    PageTransitionExit({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Left)
    
    PageTransitionEnter({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Left)
    
    PageTransitionExit({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Right)
  }

  build() {
    Column() {
      Text('页面转场测试 - 第二页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('PreviewAnimation0050_Second_001')

      Text('这是通过Push跳转进入的页面')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('PreviewAnimation0050_Second_002')

      Column() {
        Text('第二个页面')
          .fontSize(18)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
        
        Text('页面已通过Push转场进入')
          .fontSize(14)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
        
        Text('点击返回按钮查看Pop转场效果')
          .fontSize(12)
          .fontColor(Color.White)
      }
      .width('41.67%')
      .height('16.39%')
      .backgroundColor('#4CAF50')
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)
      .margin({ bottom: 30 })
      .id('PreviewAnimation0050_Second_003')

      Column({ space: 10 }) {
        Button('返回上一页 (Pop)')
          .width('90%')
          .id('PreviewAnimation0050_Second_004')
          .onClick(() => {
            router.back()
          })

        Button('返回并测试Pop转场')
          .width('90%')
          .backgroundColor('#FF6B6B')
          .id('PreviewAnimation0050_Second_005')
          .onClick(() => {
            router.back()
          })

        Text('转场效果说明:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
          .id('PreviewAnimation0050_Second_006')

        Text('• 进入时: 从右侧滑入 (SlideEffect.Right)')
          .fontSize(12)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .id('PreviewAnimation0050_Second_007')

        Text('• 返回时: 从右侧滑出 (SlideEffect.Right)')
          .fontSize(12)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .id('PreviewAnimation0050_Second_008')
      }
      .width('100%')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
