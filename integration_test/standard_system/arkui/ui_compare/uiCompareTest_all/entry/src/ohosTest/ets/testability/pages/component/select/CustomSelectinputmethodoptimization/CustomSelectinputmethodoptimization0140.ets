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
struct CustomSelectinputmethodoptimization0140 {
  @State inputValue: string = ''
  private uiContext: UIContext = this.getUIContext()

  build() {
    Column() {
      Text('UIContext promptAction.openCustomDialog输入法避让测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 30 })
      
      Text('测试参数：')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
      
      Text('alignment: Bottom')
        .fontSize(14)
        .margin({ bottom: 5 })
      
      Text('showInSubWindow: False')
        .fontSize(14)
        .margin({ bottom: 5 })
      
      Text('keyboardAvoidMode: 不设置（默认）')
        .fontSize(14)
        .margin({ bottom: 30 })
      
      Button('click customDialog')
        .id('click_custom_dialog_button_0140')
        .fontSize(18)
        .width(200)
        .height(50)
        .onClick(() => {
          this.openCustomDialogWithUIContext()
        })
      
      Blank()
      
      Text('操作说明：')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
      
      Text('1. 点击"click customDialog"按钮打开弹窗')
        .fontSize(12)
        .margin({ bottom: 5 })
      
      Text('2. 点击输入框拉起软键盘')
        .fontSize(12)
        .margin({ bottom: 5 })
      
      Text('3. 观察弹窗是否避让输入法')
        .fontSize(12)
        .margin({ bottom: 5 })
      
      Text('4. 点击输入法右上角箭头关闭键盘')
        .fontSize(12)
        .margin({ bottom: 5 })
      
      Text('5. 横竖屏切换重复操作')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }

  private openCustomDialogWithUIContext() {
    this.uiContext.getPromptAction().openCustomDialog({
      builder: () => {
        this.CustomDialogBuilder()
      },
      alignment: DialogAlignment.Bottom,
      showInSubWindow: false
    })
  }

  @Builder
  CustomDialogBuilder() {
    Column() {
      Text('UIContext Custom Dialog')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
      
      TextInput({ placeholder: '请输入内容' })
        .id('text_input_uicontext_dialog_0140')
        .width('100%')
        .height(40)
        .onChange((value: string) => {
          this.inputValue = value
        })
        .margin({ bottom: 20 })
      
      Row() {
        Button('确定')
          .id('confirm_button_uicontext_0140')
          .onClick(() => {
            this.uiContext.getPromptAction().closeCustomDialog(0)
          })
          .margin({ right: 10 })
        
        Button('取消')
          .id('cancel_button_uicontext_0140')
          .onClick(() => {
            this.uiContext.getPromptAction().closeCustomDialog(0)
          })
      }
    }
    .padding(20)
    .width('100%')
    .backgroundColor(Color.White)
  }
}
