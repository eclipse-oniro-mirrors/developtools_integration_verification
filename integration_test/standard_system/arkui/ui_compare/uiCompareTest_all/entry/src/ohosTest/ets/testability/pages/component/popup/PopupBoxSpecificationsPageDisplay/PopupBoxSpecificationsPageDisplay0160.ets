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

import { ImmersiveMode, LevelMode } from '@kit.ArkUI';

@Entry
@Component
struct PopupBoxSpecificationsPageDisplay0160 {
  @State maskEnabled: boolean = false;
  @State showGlobalMask: boolean = false;

  aboutToAppear() {
    setTimeout(() => {
      this.autoExecuteTest();
    }, 5000);
  }

  autoExecuteTest(): void {
    if (this.maskEnabled) {
      console.info('检测到手动操作，跳过自动执行');
      return;
    }
    setTimeout(() => {
      this.maskEnabled = true;
      this.showGlobalMask = true;
      console.info('自动执行: 100%遮罩已启用');
      setTimeout(() => {
        this.showActionSheet();
      }, 1000);
    }, 500);
  }

  build() {
    Stack() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Button('1. 点击100%mask')
          .id('button_100_mask')
          .width('80%')
          .height(50)
          .margin(10)
          .backgroundColor(this.maskEnabled ? '#4CAF50' : '#8E44AD')
          .fontColor(Color.White)
          .onClick(() => {
            this.maskEnabled = true;
            this.showGlobalMask = true;
            console.info('100%遮罩已启用');
          })

        Button('2. 点击ActionSheet')
          .id('button_action_sheet')
          .width('80%')
          .height(50)
          .margin(10)
          .backgroundColor(this.maskEnabled ? '#E74C3C' : '#CCCCCC')
          .fontColor(Color.White)
          .enabled(this.maskEnabled)
          .onClick(() => {
            console.info('显示ActionSheet - OVERLAY + EXTEND模式');
            this.showActionSheet();
          })

        Text('LevelMode: OVERLAY + ImmersiveMode: EXTEND')
          .fontSize(16)
          .fontColor('#FF6B35')
          .margin({ top: 20 })
      }
      .width('100%')
      .height('100%')
      .padding(20)

      if (this.showGlobalMask) {
        Column() {
          Text('OVERLAY + EXTEND 模式测试')
            .fontSize(20)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 50 })

          Button('在遮罩上显示ActionSheet')
            .id('button_show_actionsheet_on_mask')
            .backgroundColor('#E74C3C')
            .fontColor(Color.White)
            .margin({ top: 20 })
            .onClick(() => {
              this.showActionSheet();
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
    }
  }

  private showActionSheet(): void {
    this.getUIContext().showActionSheet({
      title: 'ActionSheet测试 - 0160',
      subtitle: 'LevelMode:OVERLAY + ImmersiveMode:EXTEND',
      message: '测试OVERLAY + EXTEND模式',
      autoCancel: true,
      levelMode: LevelMode.OVERLAY,
      immersiveMode: ImmersiveMode.EXTEND,
      showInSubWindow: false,
      maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
      confirm: {
        defaultFocus: true,
        value: 'Confirm button',
        action: () => {
          console.info('ActionSheet确认按钮被点击');
        }
      },
      cancel: () => {
        console.info('ActionSheet取消');
      },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: 0 },
      sheets: [
        { title: '选项1', action: () => { console.info('选项1被选择'); } },
        { title: '选项2', action: () => { console.info('选项2被选择'); } },
        { title: '选项3', action: () => { console.info('选项3被选择'); } }
      ]
    });
  }
}
