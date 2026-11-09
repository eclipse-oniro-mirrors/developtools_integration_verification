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
struct PopupBoxSpecificationsPageDisplay0060 {
  @State maskEnabled: boolean = false;
  @State actionSheetReady: boolean = false;
  @State showGlobalMask: boolean = false;

  aboutToAppear() {
    // 延迟自动执行，给手动测试留出时间
    setTimeout(() => {
      this.autoExecuteTest();
    }, 5000); // 增加到5秒，让手动测试有足够时间
  }

  autoExecuteTest(): void {
    // 检查是否已经手动触发过
    if (this.maskEnabled) {
      console.info('检测到手动操作，跳过自动执行');
      return;
    }
    // 自动点击100%mask
    setTimeout(() => {
      this.maskEnabled = true;
      this.showGlobalMask = true;
      console.info('自动执行: 100%遮罩已启用');
      
      // 然后自动显示ActionSheet
      setTimeout(() => {
        this.showActionSheet();
      }, 1000);
    }, 500);
  }

  build() {
    Stack() {
      // 主要内容
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      
      // 步骤1: 点击100%mask
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
          console.info('预期效果: 遮罩将覆盖整个窗口');
          console.info('全局遮罩现已显示');
        })

      // 步骤2: 点击ActionSheet
      Button('2. 点击ActionSheet')
        .id('button_action_sheet')
        .width('80%')
        .height(50)
        .margin(10)
        .backgroundColor(this.maskEnabled ? '#E74C3C' : '#CCCCCC')
        .fontColor(Color.White)
        .enabled(this.maskEnabled)
        .onClick(() => {
          if (!this.maskEnabled) {
            console.warn('请先点击100%mask按钮');
            return;
          }
          
          console.info('显示ActionSheet，当前配置:');
          console.info('LevelMode: EMBEDDED (已内置)');
          console.info('ImmersiveMode: EXTEND (已内置)');
          console.info('LevelUniqueId: -999 (异常值，已内置)');
          console.info('预期结果: dialog节点为全局窗口顶层，遮罩整个窗口');
          this.showActionSheet();
        })

      Text('测试配置说明')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })

      Text('LevelMode: EMBEDDED')
        .fontSize(14)
        .margin(5)

      Text('ImmersiveMode: EXTEND')
        .fontSize(14)
        .margin(5)

      Text('levelUniqueId: -999 (异常值)')
        .fontSize(14)
        .margin(5)

      Text('预期结果: dialog节点为全局窗口顶层，遮罩整个窗口')
        .fontSize(14)
        .fontColor('#E74C3C')
        .margin({ top: 10 })
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)

      // 全局遮罩层
      if (this.showGlobalMask) {
        Column() {
          Text('全局100%遮罩已激活')
            .fontSize(20)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 50 })

          Text('点击ActionSheet按钮继续测试')
            .fontSize(16)
            .fontColor(Color.White)
            .margin({ top: 20 })

          Button('关闭遮罩')
            .id('button_close_mask')
            .backgroundColor('#FF6B35')
            .fontColor(Color.White)
            .margin({ top: 20 })
            .onClick(() => {
              this.showGlobalMask = false;
              console.info('全局遮罩已关闭');
            })

          Button('在遮罩上显示ActionSheet')
            .id('button_show_actionsheet_on_mask')
            .backgroundColor('#E74C3C')
            .fontColor(Color.White)
            .margin({ top: 20 })
            .onClick(() => {
              console.info('在全局遮罩上显示ActionSheet');
              console.info('验证: dialog节点为全局窗口顶层，遮罩整个窗口');
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
      title: 'ActionSheet测试 - 0060',
      subtitle: 'LevelMode:EMBEDDED + ImmersiveMode:EXTEND',
      message: '测试异常levelUniqueId + 100%遮罩效果',
      autoCancel: true,
      levelMode: LevelMode.EMBEDDED, // 按测试要求保持EMBEDDED
      levelUniqueId: -999, // 设置为异常值（无效的节点ID）
      immersiveMode: ImmersiveMode.EXTEND, // 设置为EXTEND模式
      showInSubWindow: false, // 确保不在子窗口中显示
      maskRect: {
        x: 0,
        y: 0,
        width: '100%',
        height: '100%'
      }, // 100%遮罩覆盖整个窗口
      confirm: {
        defaultFocus: true,
        value: 'Confirm button',
        action: () => {
          console.info('ActionSheet确认按钮被点击');
          console.info('验证: dialog节点为全局窗口顶层，遮罩整个窗口');
        }
      },
      cancel: () => {
        console.info('ActionSheet取消');
      },
      onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
        console.info(`关闭原因: ${dismissDialogAction.reason}`);
        console.info('ActionSheet即将关闭');
        if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
          dismissDialogAction.dismiss();
        }
        if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
          dismissDialogAction.dismiss();
        }
      },
      alignment: DialogAlignment.Center, // 居中显示，重点是图层层级不是位置
      offset: { dx: 0, dy: 0 }, // 无偏移
      sheets: [
        {
          title: '选项1',
          action: () => {
            console.info('选项1被选择');
          }
        },
        {
          title: '选项2',
          action: () => {
            console.info('选项2被选择');
          }
        },
        {
          title: '选项3',
          action: () => {
            console.info('选项3被选择');
          }
        }
      ]
    });
  }
}
