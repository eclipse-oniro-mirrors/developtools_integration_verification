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
struct PopupBoxActionSheetScenarios0040 {
  @State isPopupShow: boolean = false

  build() {
    Column() {
      Button('点击弹出ActionSheet')
        .id('popup_button_scenarios_0040')
        .onClick(() => {
          this.isPopupShow = true
        })
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .bindSheet(this.isPopupShow, this.actionSheetBuilder(), {
      height: 400,
      showInSubWindow: true,
      maskColor: Color.Black,
      onDisappear: () => {
        this.isPopupShow = false
      }
    })
  }

  @Builder
  actionSheetBuilder() {
    Column() {
      Text('列表选择弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
      
      List() {
        ListItem() {
          Text('选项1')
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor('#f0f0f0')
        }
        .onClick(() => {
          console.log('选择了选项1')
        })
        
        ListItem() {
          Text('选项2')
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor('#f0f0f0')
        }
        .onClick(() => {
          console.log('选择了选项2')
        })
        
        ListItem() {
          Text('选项3')
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor('#f0f0f0')
        }
        .onClick(() => {
          console.log('选择了选项3')
        })
      }
      .width('90%')
      .divider({ strokeWidth: 1, color: '#e0e0e0' })
      
      // 添加按钮区域
      Row() {
        Button('取消')
          .id('cancel_button_scenarios_0040')
          .backgroundColor('#f0f0f0')
          .fontColor('#333333')
          .onClick(() => {
            this.isPopupShow = false
          })
          .margin({ right: 10 })
        
        Button('确定')
          .id('confirm_button_scenarios_0040')
          .backgroundColor('#007AFF')
          .fontColor(Color.White)
          .onClick(() => {
            console.log('确定选择')
            this.isPopupShow = false
          })
          .margin({ left: 10 })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ top: 20, bottom: 20 })
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}
