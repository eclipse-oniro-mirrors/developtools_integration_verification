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
struct SetAutofocusTransferFocusview0530 {
  @State focusLog: string = ''
  @State isModal1Visible: boolean = false

  @Builder
  modal1Builder() {
    Column() {
      Text('Modal1 Page')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0530_modal1_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      Button('defaultFocus Button Modal1')
        .id('setautofocustransfer_focusview_0530_modal1_default_focus')
        .width('80%')
        .height(50)
        .defaultFocus(true)
        .onFocus(() => {
          this.focusLog = 'Modal1_DefaultFocus Gain TestFocus'
          console.log('Modal1_DefaultFocus Gain TestFocus')
        })
        .onBlur(() => {
          this.focusLog = 'Modal1_DefaultFocus Lost TestFocus'
          console.log('Modal1_DefaultFocus Lost TestFocus')
        })

      Button('close modal 1')
        .id('setautofocustransfer_focusview_0530_close_modal1')
        .width(150)
        .height(50)
        .margin({ top: 20 })
        .onClick(() => {
          this.isModal1Visible = false
        })
    }
    .width('80%')
    .height('50%')
    .backgroundColor(Color.White)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0530')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('modal场景测试')
        .id('setautofocustransfer_focusview_0530_modal_test')
        .width('90%')
        .height(20)

      Column() {
        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0530_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0530_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'Modal_DefaultFocus Gain TestFocus'
            console.log('Modal_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Modal_DefaultFocus Lost TestFocus'
            console.log('Modal_DefaultFocus Lost TestFocus')
          })

        Button('transition modal 1')
          .id('setautofocustransfer_focusview_0530_modal1_btn')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.isModal1Visible = true
          })
          .bindContentCover(this.isModal1Visible, this.modal1Builder(), {
            modalTransition: ModalTransition.DEFAULT,
            onDisappear: () => {
              this.isModal1Visible = false
            }
          })
      }
      .width('100%')
      .height('80%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

