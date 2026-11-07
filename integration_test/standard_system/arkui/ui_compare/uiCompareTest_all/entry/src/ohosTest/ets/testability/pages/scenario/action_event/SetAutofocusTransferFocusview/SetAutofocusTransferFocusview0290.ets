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
struct SetAutofocusTransferFocusview0290 {
  @State inputText: string = ''
  @State focusLog: string = ''
  @State isModalVisible: boolean = false

  @Builder
  modalBuilder() {
    Column() {
      Text('Modal1 Page')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('这是Modal1页面内容')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('close modal 1')
        .id('setautofocustransfer_focusview_0290_close_modal')
        .width(150)
        .height(50)
        .onClick(() => {
          this.isModalVisible = false
        })
    }
    .width('80%')
    .height('50%')
    .backgroundColor(Color.White)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
    .focusable(false)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0290')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('ModalPage场景测试')
        .id('setautofocustransfer_focusview_0290_modal_test')
        .width('90%')
        .height(20)

      Column() {
        TextInput({ placeholder: '请输入内容', text: this.inputText })
          .id('setautofocustransfer_focusview_0290_textinput')
          .width('90%')
          .height(50)
          .defaultFocus(false)
          .onChange((value: string) => {
            this.inputText = value
          })
          .onFocus(() => {
            this.focusLog = 'Modal_TextInput Gain TestFocus'
            console.log('Modal_TextInput Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Modal_TextInput Lost TestFocus'
            console.log('Modal_TextInput Lost TestFocus')
          })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0290_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })

        Button('transition modal 1')
          .id('setautofocustransfer_focusview_0290_modal_btn')
          .width('80%')
          .height(50)
          .margin({ top: 5 })
          .onClick(() => {
            this.isModalVisible = true
          })
          .bindContentCover(this.isModalVisible, this.modalBuilder(), {
            modalTransition: ModalTransition.DEFAULT,
            onDisappear: () => {
              this.isModalVisible = false
            }
          })
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

