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

@CustomDialog
struct CheckboxDialog0460 {
  controller: CustomDialogController
  @State focusLog: string = ''
  @State isChecked1: boolean = false
  @State isChecked2: boolean = false
  @State isChecked3: boolean = false

  build() {
    Column() {
      Text('文本+勾选弹出框')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0460_dialog_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      Row() {
        Checkbox()
          .select(this.isChecked1)
          .onChange((value: boolean) => {
            this.isChecked1 = value
          })
        Text('选项1')
          .fontSize(16)
          .margin({ left: 8 })
      }
      .id('setautofocustransfer_focusview_0460_option1')
      .width('80%')
      .height('3.28%')
      .margin({ bottom: 10 })
      .onClick(() => {
        this.isChecked1 = !this.isChecked1
        this.focusLog = 'Option1 Clicked'
        console.log('Option1 Clicked')
      })

      Row() {
        Checkbox()
          .select(this.isChecked2)
          .onChange((value: boolean) => {
            this.isChecked2 = value
          })
        Text('选项2')
          .fontSize(16)
          .margin({ left: 8 })
      }
      .id('setautofocustransfer_focusview_0460_option2')
      .width('80%')
      .height('3.28%')
      .margin({ bottom: 10 })
      .onClick(() => {
        this.isChecked2 = !this.isChecked2
        this.focusLog = 'Option2 Clicked'
        console.log('Option2 Clicked')
      })

      Row() {
        Checkbox()
          .select(this.isChecked3)
          .onChange((value: boolean) => {
            this.isChecked3 = value
          })
        Text('选项3')
          .fontSize(16)
          .margin({ left: 8 })
      }
      .id('setautofocustransfer_focusview_0460_option3')
      .width('80%')
      .height('3.28%')
      .margin({ bottom: 10 })
      .onClick(() => {
        this.isChecked3 = !this.isChecked3
        this.focusLog = 'Option3 Clicked'
        console.log('Option3 Clicked')
      })

      Button('确定')
        .id('setautofocustransfer_focusview_0460_confirm')
        .width(150)
        .height(50)
        .margin({ top: 10 })
        .onClick(() => {
          this.controller.close()
        })
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
    .focusable(false)
  }
}

@Component
struct PageTwo0460 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CheckboxDialog0460({}),
    autoCancel: true,
    customStyle: true
  })

  aboutToAppear() {
    this.dialogController.open()
  }

  build() {
    NavDestination() {
      Column() {
        Text('PageTwo')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0460_pagetwo_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('返回')
          .id('setautofocustransfer_focusview_0460_pagetwo_back')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.navPathStack.pop()
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .focusable(false)
    }
    .title('PageTwo')
  }
}

@Component
struct PageOne0460 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0460_pageone_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0460_pageone_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'PageOne_DefaultFocus Gain TestFocus'
            console.log('PageOne_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'PageOne_DefaultFocus Lost TestFocus'
            console.log('PageOne_DefaultFocus Lost TestFocus')
          })

        Button('文本+勾选弹出框')
          .id('setautofocustransfer_focusview_0460_checkbox_dialog')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.navPathStack.pushPathByName('PageTwo', null)
          })

        Button('返回')
          .id('setautofocustransfer_focusview_0460_back')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.navPathStack.pop()
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .focusable(false)
    }
    .title('PageOne')
  }
}

@Entry
@Component
struct SetAutofocusTransferFocusview0460 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  PageMap(name: string) {
    if (name === 'PageOne') {
      PageOne0460()
    } else if (name === 'PageTwo') {
      PageTwo0460()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0460')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('defaultFocus场景测试')
        .id('setautofocustransfer_focusview_0460_focus_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0460_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 10 })

          Button('defaultFocus Button')
            .id('setautofocustransfer_focusview_0460_default_focus')
            .width('80%')
            .height(50)
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'DefaultFocus_Button Gain TestFocus'
              console.log('DefaultFocus_Button Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'DefaultFocus_Button Lost TestFocus'
              console.log('DefaultFocus_Button Lost TestFocus')
            })

          Button('跳转')
            .id('setautofocustransfer_focusview_0460_jump')
            .width('80%')
            .height(50)
            .margin({ top: 10 })
            .onClick(() => {
              this.navPathStack.pushPathByName('PageOne', null)
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('90%')
    }
    .width('100%')
    .height('100%')
  }
}

