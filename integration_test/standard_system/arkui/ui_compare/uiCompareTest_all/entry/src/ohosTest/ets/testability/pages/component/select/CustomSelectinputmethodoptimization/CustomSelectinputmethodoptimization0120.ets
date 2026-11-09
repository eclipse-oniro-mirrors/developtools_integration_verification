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
struct CustomSelectinputmethodoptimization0120 {
  @State inputValue: string = ''

  build() {
    Column() {
      Text('🎆 PromptAction 输入法避让测试')
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor('#F39C12')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
      
      Text('Test Case 0120 - Top Default')
        .fontSize(14)
        .fontColor('#95A5A6')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 30 })
      
      // 参数卡片
      Column() {
        Text('📋 测试参数')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#2C3E50')
          .margin({ bottom: 15 })
        
        Row() {
          Text('alignment: Top')
            .fontSize(14)
            .fontColor('#F39C12')
            .backgroundColor('#FEF5E7')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(8)
          
          Text('showInSubWindow: True')
            .fontSize(14)
            .fontColor('#3498DB')
            .backgroundColor('#EBF3FD')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(8)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ bottom: 10 })
        
        Row() {
          Text('height: 600')
            .fontSize(14)
            .fontColor('#27AE60')
            .backgroundColor('#E8F8F5')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(8)
          
          Text('keyboardAvoidMode: 默认')
            .fontSize(14)
            .fontColor('#8E44AD')
            .backgroundColor('#F4ECF7')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(8)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width('90%')
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(15)
      .shadow({ radius: 8, color: '#00000010', offsetX: 0, offsetY: 2 })
      .margin({ bottom: 30 })
      
      Button('🚀 打开PromptAction弹窗')
        .id('click_custom_dialog_button_0120')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width(260)
        .height(55)
        .fontColor('#FFFFFF')
        .backgroundColor('#F39C12')
        .borderRadius(28)
        .shadow({ radius: 10, color: '#F39C1230', offsetX: 0, offsetY: 4 })
        .onClick(() => {
          this.openCustomDialog()
        })
        .margin({ bottom: 30 })
      
      Blank()
      
      // 操作说明
      Column() {
        Text('📖 操作说明')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#2C3E50')
          .margin({ bottom: 15 })
        
        Column() {
          Text('1. 点击上方按钮打开PromptAction顶部弹窗')
            .fontSize(13)
            .fontColor('#34495E')
            .margin({ bottom: 6 })
          
          Text('2. 点击弹窗内的输入框拉起软键盘')
            .fontSize(13)
            .fontColor('#34495E')
            .margin({ bottom: 6 })
          
          Text('3. 观察弹窗是否自动避让输入法（默认模式）')
            .fontSize(13)
            .fontColor('#34495E')
            .margin({ bottom: 6 })
          
          Text('4. 点击输入法右上角箭头关闭键盘')
            .fontSize(13)
            .fontColor('#34495E')
            .margin({ bottom: 6 })
          
          Text('5. 横竖屏切换重复测试操作')
            .fontSize(13)
            .fontColor('#34495E')
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('90%')
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(15)
      .alignItems(HorizontalAlign.Start)
      .shadow({ radius: 8, color: '#00000010', offsetX: 0, offsetY: 2 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  private openCustomDialog() {
    promptAction.openCustomDialog({
      builder: () => {
        this.CustomDialogBuilder()
      },
      alignment: DialogAlignment.Top,
      showInSubWindow: true,
      height: 600
    })
  }

  @Builder
  CustomDialogBuilder() {
    Column() {
      Text('🎆 PromptAction 顶部弹窗')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#F39C12')
        .margin({ bottom: 20 })
      
      TextInput({ placeholder: '🔍 请输入您的测试内容...' })
        .id('text_input_prompt_dialog_0120')
        .width('95%')
        .height(50)
        .fontSize(16)
        .backgroundColor('#FEF5E7')
        .borderRadius(15)
        .padding({ left: 16, right: 16 })
        .placeholderColor('#F39C12')
        .border({ width: 1, color: '#F8C471' })
        .onChange((value: string) => {
          this.inputValue = value
        })
        .margin({ bottom: 25 })
      
      Row() {
        Button('✅ 确定')
          .id('confirm_button_prompt_0120')
          .width(100)
          .height(45)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#F39C12')
          .borderRadius(22)
          .onClick(() => {
            promptAction.closeCustomDialog(0)
          })
          .margin({ right: 15 })
        
        Button('❌ 取消')
          .id('cancel_button_prompt_0120')
          .width(100)
          .height(45)
          .fontSize(16)
          .fontColor('#F39C12')
          .backgroundColor('#FFFFFF')
          .borderRadius(22)
          .border({ width: 1, color: '#F39C12' })
          .onClick(() => {
            promptAction.closeCustomDialog(0)
          })
      }
      .justifyContent(FlexAlign.Center)
    }
    .padding(25)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius({ bottomLeft: 20, bottomRight: 20 })
    .shadow({ radius: 15, color: '#F39C1220', offsetX: 0, offsetY: 5 })
  }
}
