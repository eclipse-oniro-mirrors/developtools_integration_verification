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
struct CustomSelectinputmethodoptimization0040 {
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
      
      Text('keyboardAvoidMode: undefined')
        .fontSize(14)
        .margin({ bottom: 30 })
      
      // 操作按钮
      Button('🎯 打开UIContext弹窗')
        .id('click_custom_dialog_button_0040')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width(280)
        .height(60)
        .fontColor('#FFFFFF')
        .backgroundColor('#16A085')
        .borderRadius(30)
        .shadow({ radius: 15, color: '#16A08540', offsetX: 0, offsetY: 8 })
        .onClick(() => {
          this.openCustomDialogWithUIContext()
        })
        .margin({ bottom: 40 })
      
      Blank()
      
      // 操作说明卡片
      Column() {
        Text('📖 操作指南')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#34495E')
          .margin({ bottom: 15 })
        
        Column() {
          Text('1️⃣ 点击上方按钮打开UIContext弹窗')
            .fontSize(14)
            .fontColor('#2C3E50')
            .margin({ bottom: 8 })
          
          Text('2️⃣ 点击弹窗内的输入框拉起软键盘')
            .fontSize(14)
            .fontColor('#2C3E50')
            .margin({ bottom: 8 })
          
          Text('3️⃣ 观察弹窗是否被输入法覆盖')
            .fontSize(14)
            .fontColor('#2C3E50')
            .margin({ bottom: 8 })
          
          Text('4️⃣ 点击输入法右上角箭头关闭键盘')
            .fontSize(14)
            .fontColor('#2C3E50')
            .margin({ bottom: 8 })
          
          Text('5️⃣ 横竖屏切换重复测试操作')
            .fontSize(14)
            .fontColor('#2C3E50')
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('90%')
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(15)
      .alignItems(HorizontalAlign.Start)
      .shadow({ radius: 8, color: '#00000008', offsetX: 0, offsetY: 2 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, bottom: 20 })
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
      Text('🎯 UIContext 弹窗')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#16A085')
        .margin({ bottom: 25 })
      
      Text('📝 请在下方输入框中输入内容')
        .fontSize(16)
        .fontColor('#7F8C8D')
        .margin({ bottom: 20 })
      
      TextInput({ placeholder: '🔍 请输入您的测试内容...' })
        .id('text_input_uicontext_dialog_0040')
        .width('95%')
        .height(55)
        .fontSize(16)
        .backgroundColor('#E8F6F3')
        .borderRadius(18)
        .padding({ left: 20, right: 20 })
        .placeholderColor('#52C41A')
        .border({ width: 2, color: '#A3E4D7' })
        .focusable(true)
        .onChange((value: string) => {
          this.inputValue = value
        })
        .margin({ bottom: 20 })
      
      Row() {
        Button('✨ 确认提交')
          .id('confirm_button_uicontext_0040')
          .onClick(() => {
            this.uiContext.getPromptAction().closeCustomDialog(0)
          })
          .margin({ right: 20 })
        
        Button('🚫 取消操作')
          .id('cancel_button_uicontext_0040')
          .onClick(() => {
            this.uiContext.getPromptAction().closeCustomDialog(0)
          })
      }
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20 })
    }
    .padding(30)
    .width('100%')
    .backgroundColor(Color.White)
  }
}
