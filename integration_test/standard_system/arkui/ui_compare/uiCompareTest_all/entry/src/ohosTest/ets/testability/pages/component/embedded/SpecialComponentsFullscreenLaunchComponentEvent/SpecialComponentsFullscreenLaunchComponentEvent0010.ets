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

// 全屏模态页面组件
@Component
struct ModalPage {
  @State inputText: string = ''
  @State clickCount: number = 0

  build() {
    Column() {
      Text('全屏模态页面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ModalPage_001')

      Text('这是一个全屏模态拉起的页面')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ModalPage_002')

      // 图片
      Image($r('app.media.app_icon'))
        .width(100)
        .height(100)
        .margin({ bottom: 20 })
        .id('ModalPage_003')
        .onClick(() => {
          this.clickCount++
          console.info('[ModalPage] Image clicked, count:', this.clickCount)
        })

      Text(`图片点击次数: ${this.clickCount}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ModalPage_004')

      // Drag Page按钮
      Button('drag page')
        .width('80%')
        .margin({ bottom: 20 })
        .id('ModalPage_005')
        .onClick(() => {
          console.info('[ModalPage] Drag page button clicked')
        })

      // 输入框 - 点击后应该拉起软键盘
      TextInput({ placeholder: '点击此处输入文本' })
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .id('ModalPage_006')
        .onChange((value: string) => {
          this.inputText = value
          console.info('[ModalPage] Input text:', value)
        })

      Text(`输入内容: ${this.inputText}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ModalPage_007')

      Text('测试说明: 点击输入框应该能正常拉起软键盘')
        .fontSize(12)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Center)
        .width('90%')
        .id('ModalPage_008')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Center)
  }
}

@Entry
@Component
struct SpecialComponentsFullscreenLaunchComponentEvent0010 {
  @State isShowModal: boolean = false

  // 全屏模态转场样式
  @Builder
  myBuilder() {
    ModalPage()
  }

  build() {
    Column() {
      Text('全屏模态拉起原子化服务点击事件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_001')

      Text('测试说明: 测试全屏模态中的手势和点击事件')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_002')

      // 进入全屏模态手势测试按钮
      Button('进入全屏模态手势测试')
        .width('80%')
        .height(50)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_003')
        .onClick(() => {
          this.isShowModal = true
          console.info('[FullscreenLaunch] Opening fullscreen modal')
        })

      // default test按钮
      Button('default test')
        .width('80%')
        .height(50)
        .fontSize(16)
        .margin({ bottom: 20 })
        .backgroundColor('#4CAF50')
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_004')
        .onClick(() => {
          console.info('[FullscreenLaunch] Default test button clicked')
          this.isShowModal = true
        })

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_005')

      Text('1. 点击"进入全屏模态手势测试"按钮')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_006')

      Text('2. 点击"default test"按钮')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_007')

      Text('3. 在模态页面中点击图片，点击"drag page"按钮')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_008')

      Text('4. 点击输入框，验证能否正常拉起软键盘')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010_009')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
    .bindContentCover(this.isShowModal, this.myBuilder(), {
      modalTransition: ModalTransition.DEFAULT,
      backgroundColor: Color.White,
      onAppear: () => {
        console.info('[FullscreenLaunch] Modal appeared')
      },
      onDisappear: () => {
        console.info('[FullscreenLaunch] Modal disappeared')
        this.isShowModal = false
      }
    })
  }
}
