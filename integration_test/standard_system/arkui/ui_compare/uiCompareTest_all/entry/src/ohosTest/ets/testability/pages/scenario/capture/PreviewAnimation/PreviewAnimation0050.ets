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
struct PreviewAnimation0050 {
  @State message: string = '页面转场 - PageTransitionEnter (Push)'

  // 页面转场效果 - 进入时
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
      Text('页面转场测试 - 主页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('PreviewAnimation0050_001')

      Text('PageTransitionEnter设置RouteType为Push')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('PreviewAnimation0050_002')

      Text('特点: 跳转至下一页面时触发进入效果(从右侧滑入)')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 30 })
        .textAlign(TextAlign.Center)
        .id('PreviewAnimation0050_003')

      Column() {
        Text('这是第一个页面')
          .fontSize(18)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
        
        Text('点击下方按钮跳转到第二个页面')
          .fontSize(14)
          .fontColor(Color.White)
      }
      .width('41.67%')
      .height('16.39%')
      .backgroundColor('#007DFF')
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)
      .margin({ bottom: 30 })
      .id('PreviewAnimation0050_004')

      Scroll() {
        Column({ space: 10 }) {
          Button('跳转到第二页 (Push)')
            .width('90%')
            .id('PreviewAnimation0050_005')
            .onClick(() => {
              router.pushUrl({
                url: 'testability/pages/scenario/capture/PreviewAnimation/PreviewAnimation0050_Second'
              })
            })

          Button('测试Push转场效果')
            .width('90%')
            .backgroundColor('#FF6B6B')
            .id('PreviewAnimation0050_006')
            .onClick(() => {
              router.pushUrl({
                url: 'testability/pages/scenario/capture/PreviewAnimation/PreviewAnimation0050_Second',
                params: { from: 'test' }
              })
            })

          Text('说明:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })
            .id('PreviewAnimation0050_007')

          Text('1. Push转场: 新页面从右侧滑入,当前页面从左侧滑出')
            .fontSize(12)
            .fontColor('#666666')
            .textAlign(TextAlign.Start)
            .width('90%')
            .id('PreviewAnimation0050_008')

          Text('2. Pop转场: 返回时,当前页面从右侧滑出,上一页面从左侧滑入')
            .fontSize(12)
            .fontColor('#666666')
            .textAlign(TextAlign.Start)
            .width('90%')
            .id('PreviewAnimation0050_009')

          Text('3. 转场动画持续时间: 1000ms')
            .fontSize(12)
            .fontColor('#666666')
            .textAlign(TextAlign.Start)
            .width('90%')
            .id('PreviewAnimation0050_010')
        }
        .width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .height('40%')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
