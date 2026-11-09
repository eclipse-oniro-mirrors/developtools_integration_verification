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
struct CustomDialogComponent0030 {
  @State inputValue: string = ''
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogComponent0030({}),
    alignment: DialogAlignment.Top,
    showInSubWindow: true,
    height: 600
  })

  build() {
    Column() {
      Text('🎆 顶部弹窗测试')
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor('#8E44AD')
        .margin({ bottom: 25 })
      
      Text('📝 请在下方输入框中输入内容')
        .fontSize(16)
        .fontColor('#7F8C8D')
        .margin({ bottom: 20 })
      
      TextInput({ placeholder: '🔍 请输入您的测试内容...' })
        .id('text_input_custom_dialog_0030')
        .width('100%')
        .height(40)
        .onChange((value: string) => {
          this.inputValue = value
        })
        .margin({ bottom: 20 })
      
      Row() {
        Button('✨ 确认提交')
          .id('confirm_button_0030')
          .width(130)
          .height(55)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .backgroundColor('#8E44AD')
          .borderRadius(28)
          .shadow({ radius: 12, color: '#8E44AD40', offsetX: 0, offsetY: 6 })
          .onClick(() => {
            this.controller.close()
          })
          .margin({ right: 20 })
        
        Button('🚫 取消操作')
          .id('cancel_button_0030')
          .width(130)
          .height(55)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#8E44AD')
          .backgroundColor('#FFFFFF')
          .borderRadius(28)
          .border({ width: 2, color: '#8E44AD' })
          .shadow({ radius: 8, color: '#8E44AD20', offsetX: 0, offsetY: 4 })
          .onClick(() => {
            this.controller.close()
          })
      }
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20 })
    }
    .padding(30)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius({ bottomLeft: 25, bottomRight: 25 })
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .shadow({ radius: 25, color: '#00000015', offsetX: 0, offsetY: 8 })
  }
}

@Entry
@Component
struct CustomSelectinputmethodoptimization0030 {
  private dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogComponent0030({}),
    alignment: DialogAlignment.Top,
    showInSubWindow: true,
    height: 600
  })

  build() {
    Column() {
      Text('CustomDialog输入法避让测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 30 })
      
      Text('测试参数：')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
      
      Text('alignment: Top')
        .fontSize(14)
        .margin({ bottom: 5 })
      
      Text('showInSubWindow: True')
        .fontSize(14)
        .margin({ bottom: 5 })
      
      Text('height: 600')
        .fontSize(14)
        .margin({ bottom: 5 })
      
      Text('keyboardAvoidMode: 不设置（默认）')
        .fontSize(14)
        .margin({ bottom: 30 })
      
      // 操作按钮
      Button('🎯 打开顶部弹窗')
        .id('click_custom_dialog_button_0030')
        .fontSize(18)
        .width(200)
        .height(50)
        .onClick(() => {
          this.dialogController.open()
        })
        .margin({ bottom: 40 })
      
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
    .padding({ left: 20, right: 20, bottom: 20 })
  }
}