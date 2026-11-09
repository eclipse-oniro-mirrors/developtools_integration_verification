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
struct CommonAttrTabfocus0060 {
  @State focusLog: string = ''
  @State isDialogOpen: boolean = false

  @Builder
  dialogBuilder() {
    Column() {
      Text('Dialog弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Button('btn1')
        .id('commonattr_tabfocus_0060_dialog_btn1')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = 'btn1 获得焦点'
        })

      TextInput({ placeholder: '请输入内容' })
        .id('commonattr_tabfocus_0060_dialog_textinput')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = 'TextInput 获得焦点'
        })

      Button('close')
        .id('commonattr_tabfocus_0060_dialog_close')
        .width('80%')
        .height(40)
        .onClick(() => {
          this.isDialogOpen = false
        })
        .onFocus(() => {
          this.focusLog = 'close 获得焦点'
        })
    }
    .width('90%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0060')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('dialog弹窗中，tab键走焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0060_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('ComponentDialog')
          .id('commonattr_tabfocus_0060_open_dialog')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.isDialogOpen = true
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('Dialog焦点测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
    .bindContentCover($$this.isDialogOpen, this.dialogBuilder(), {
      modalTransition: ModalTransition.NONE,
      backgroundColor: Color.Transparent,
      onDisappear: () => {
        this.isDialogOpen = false
      }
    })
  }
}
