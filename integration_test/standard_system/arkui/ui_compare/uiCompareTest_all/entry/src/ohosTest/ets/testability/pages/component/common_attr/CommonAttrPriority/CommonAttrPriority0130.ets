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
struct FocusPriorityDialog {
  controller: CustomDialogController
  @State focusLog: string = ''

  build() {
    Column() {
      Text('Dialog焦点优先级测试')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text(this.focusLog)
        .id('dialog_priority_0130_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      // 焦点组
      Column() {
        Text('焦点组')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn1')
          .id('dialog_priority_0130_btn1')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn1 获得焦点'
          })

        Button('FocusPriority.PREVIOUS')
          .id('dialog_priority_0130_previous')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .focusScopePriority('dialogFocusGroup', FocusPriority.PREVIOUS)
          .onFocus(() => {
            this.focusLog = 'FocusPriority.PREVIOUS 获得焦点'
          })

        Button('btn3')
          .id('dialog_priority_0130_btn3')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn3 获得焦点'
          })

        Button('FocusPriority.PRIOR')
          .id('dialog_priority_0130_prior_group')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .focusScopePriority('dialogFocusGroup', FocusPriority.PRIOR)
          .onFocus(() => {
            this.focusLog = 'FocusPriority.PRIOR(焦点组) 获得焦点'
          })
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .margin({ bottom: 10 })
      .focusScopeId('dialogFocusGroup', true)

      // 非焦点组
      Column() {
        Text('非焦点组')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn5')
          .id('dialog_priority_0130_btn5')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn5 获得焦点'
          })

        Button('FocusPriority.PRIOR')
          .id('dialog_priority_0130_prior')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .focusScopePriority('dialogNonFocusGroup', FocusPriority.PRIOR)
          .onFocus(() => {
            this.focusLog = 'FocusPriority.PRIOR(非焦点组) 获得焦点'
          })

        Button('btn7')
          .id('dialog_priority_0130_btn7')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn7 获得焦点'
          })
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#E0E0E0')
      .borderRadius(8)
      .margin({ bottom: 10 })
      .focusScopeId('dialogNonFocusGroup', false)

      Button('关闭')
        .id('dialog_priority_0130_close')
        .width('60%')
        .height(20)
        .onClick(() => {
          this.controller.close()
        })
    }
    .width('100%')
    .padding(20)
  }
}

@Entry
@Component
struct CommonAttrPriority0130 {
  @State focusLog: string = ''
  dialogController: CustomDialogController = new CustomDialogController({
    builder: FocusPriorityDialog(),
    autoCancel: false,
    alignment: DialogAlignment.Center
  })

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0130')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('dialog组件，焦点组和非焦点组之间走焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_priority_0130_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('ComponentDialog')
          .id('button_priority_0130_dialog')
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.dialogController.open()
          })

        // 普通按钮用于走焦测试
        Column() {
          Text('普通按钮组')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1')
            .id('button_priority_0130_btn1')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('Button2')
            .id('button_priority_0130_btn2')
            .width('80%')
            .height(20)
            .onFocus(() => {
              this.focusLog = 'Button2 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('dialogFocusPrioirty')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

