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
import { router } from '@kit.ArkUI'

@Entry
@Component
struct SetAutofocusTransferFocusview0180 {
  @State focusLog: string = ''
  @State showSecondPage: boolean = false

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0180')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('pageTransition路由场景测试')
        .id('setautofocustransfer_focusview_0180_transition_test')
        .width('90%')
        .height(20)

      Column() {
        Button('按钮1')
          .id('setautofocustransfer_focusview_0180_button1')
          .width('80%')
          .height(50)
          .backgroundColor(Color.Pink)
          .defaultFocus(false)
          .focusable(true)
          .onFocus(() => {
            this.focusLog = 'Button_1 Gain TestFocus'
            console.log('Button_1 Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Button_1 Lost TestFocus'
            console.log('Button_1 Lost TestFocus')
          })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0180_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })

        Image($r('app.media.icon'))
          .id('setautofocustransfer_focusview_0180_image')
          .width(100)
          .height(100)
          .margin({ top: 10 })
          .onClick(() => {
            this.showSecondPage = true
          })

        Text('点击上方图片跳转')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ top: 5 })

        if (this.showSecondPage) {
          Column() {
            Text('跳转后的页面')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Image($r('app.media.icon'))
              .id('setautofocustransfer_focusview_0180_image_second')
              .width(100)
              .height(100)
              .onClick(() => {
                this.showSecondPage = false
              })

            Text('点击图片返回')
              .fontSize(12)
              .fontColor(Color.Gray)
              .margin({ top: 5 })
          }
          .width('100%')
          .height('50%')
          .backgroundColor('#F0F0F0')
          .justifyContent(FlexAlign.Center)
          .transition({ type: TransitionType.Insert, opacity: 0 })
          .transition({ type: TransitionType.Delete, opacity: 0 })
        }
      }
      .width('100%')
      .height('80%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }

  pageTransition() {
    PageTransitionEnter({ duration: 300, curve: Curve.Linear })
      .onEnter((type: RouteType, progress: number) => {
        console.log('PageTransition Enter progress: ' + progress)
      })
    PageTransitionExit({ duration: 300, curve: Curve.Linear })
      .onExit((type: RouteType, progress: number) => {
        console.log('PageTransition Exit progress: ' + progress)
      })
  }
}

