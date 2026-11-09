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


@Entry
@Component
struct PopupboxSpecification0260 {
  @State isPromptVisible: boolean = false
  @State inputText: string = ''

  build() {
    Column() {
      Button('点击弹出无按钮prompt弹窗(无蒙层)')
        .id('popup_button_0260')
        .onClick(() => {
          this.isPromptVisible = true
        })
        .margin({ top: 50 })
      
      if (this.inputText) {
        Text(`输入内容: ${this.inputText}`)
          .fontSize(16)
          .margin({ top: 20 })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .bindContentCover(this.isPromptVisible, this.promptDialog, {
      modalTransition: ModalTransition.NONE,
      onAppear: () => {
        console.info('Prompt dialog appeared')
      },
      onDisappear: () => {
        this.isPromptVisible = false
      }
    })
  }

  @Builder
  promptDialog() {
    Column() {
      Text('输入提示')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })
      
      Text('这是一个无按钮prompt弹窗，无蒙层')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
      
      TextInput({ placeholder: '请输入内容', text: this.inputText })
        .width('100%')
        .height(40)
        .fontSize(16)
        .borderRadius(4)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Gray })
        .onChange((value: string) => {
          this.inputText = value
        })
        .onSubmit(() => {
          this.isPromptVisible = false
        })
        .margin({ bottom: 20 })
      
      Text('点击输入框外区域或按回车键关闭')
        .fontSize(12)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
    }
    .width('38.89%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 2 })
    .onClick(() => {
      this.isPromptVisible = false
    })
  }
}
