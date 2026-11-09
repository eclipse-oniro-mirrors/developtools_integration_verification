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

import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct BackwardAnalysisAln1410 {
  @State inputText: string = ''

  aboutToAppear() {
    // 自动弹出toast
    setTimeout(() => {
      this.showToast()
    }, 500)
  }

  showToast() {
    promptAction.showToast({
      message: 'Toast消息(showMode:DEFAULT)',
      duration: 5000,
      showMode: promptAction.ToastShowMode.DEFAULT
    })
  }

  build() {
    Column() {
      Text('Toast避让输入法测试(DEFAULT)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('显示Toast')
        .id('show_toast_btn_1410')
        .onClick(() => {
          this.showToast()
        })
        .margin({ bottom: 20 })

      Text('请点击输入框拉起输入法，观察Toast是否避让输入法')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })

      TextInput({ placeholder: '点击此处拉起输入法', text: this.inputText })
        .id('text_input_1410')
        .width('90%')
        .height(50)
        .onChange((value: string) => {
          this.inputText = value
        })
        .margin({ bottom: 20 })

      Text('输入内容: ' + this.inputText)
        .fontSize(14)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}

