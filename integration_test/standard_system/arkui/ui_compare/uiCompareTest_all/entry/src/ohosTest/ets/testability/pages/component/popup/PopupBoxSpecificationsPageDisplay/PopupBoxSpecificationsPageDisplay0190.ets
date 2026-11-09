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

import { ImmersiveMode, LevelMode, router } from '@kit.ArkUI';


@Entry
@Component
struct PopupBoxSpecificationsPageDisplay0190 {
  @State offsetEnabled: boolean = false;

  aboutToAppear() {
    setTimeout(() => {
      this.autoExecuteTest();
    }, 5000);
  }

  autoExecuteTest(): void {
    if (this.offsetEnabled) {
      console.info('检测到手动操作，跳过自动执行');
      return;
    }
    setTimeout(() => {
      this.offsetEnabled = true;
      console.info('自动执行: 向下偏移已启用');
      setTimeout(() => {
        this.showActionSheet();
      }, 1000);
    }, 500);
  }

  build() {
    Column() {
      Row() {
        Button('返回首页')
          .id('button_return_home')
          .fontSize(16)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .margin(10)
          .onClick(() => {
            this.navigateToHome();
          })
        Blank()
        Text('测试页面0190')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin(10)
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#F0F0F0')

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Button(this.offsetEnabled ? '4. 向下偏移已启用 ✓' : '4. 点击向下偏移')
          .id('button_offset_down')
          .width('80%')
          .height(50)
          .margin(10)
          .backgroundColor(this.offsetEnabled ? '#4CAF50' : '#9C27B0')
          .fontColor(Color.White)
          .onClick(() => {
            this.offsetEnabled = true;
            console.info('向下偏移已启用');
          })

        Button('5. 点击ActionSheet')
          .id('button_show_actionsheet')
          .width('80%')
          .height(50)
          .margin(10)
          .backgroundColor('#E74C3C')
          .fontColor(Color.White)
          .onClick(() => {
            console.info('显示ActionSheet - OVERLAY + 异常ImmersiveMode + 偏移');
            this.showActionSheet();
          })

        Column() {
          Text('测试配置 (已内置):')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20, bottom: 10 })

          Text('LevelMode: OVERLAY ✓')
            .fontSize(14)
            .margin(5)
            .fontColor(Color.Green)

          Text('ImmersiveMode: 异常值(-888) ✓')
            .fontSize(14)
            .margin(5)
            .fontColor(Color.Green)

          Text('showInSubWindow: true (支持跟随) ✓')
            .fontSize(14)
            .margin(5)
            .fontColor(Color.Green)

          Text('isModal: false (允许页面切换) ✓')
            .fontSize(14)
            .margin(5)
            .fontColor(Color.Green)

          Text(`向下偏移: ${this.offsetEnabled ? '已启用 (100px) ✓' : '未启用'}`)
            .fontSize(14)
            .margin(5)
            .fontColor(this.offsetEnabled ? Color.Green : Color.Red)

          Text('预期结果:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Text('• dialog遮罩蒙层被设置下移')
            .fontSize(12)
            .margin(2)

          Text('• 点击返回首页后，dialog弹窗跟随到首页')
            .fontSize(12)
            .margin(2)

          Text('• 点击空白处或按钮能关闭dialog弹窗')
            .fontSize(12)
            .margin(2)
        }
        .width('80%')
        .padding(15)
        .margin({ top: 20 })
        .backgroundColor('#F8F9FA')
        .borderRadius(8)
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
    }
  }

  private navigateToHome(): void {
    try {
      // 使用pushUrl方法导航到首页
      router.pushUrl({
        url: 'testability/pages/Index'
      });
      console.info('成功导航到首页');
      console.info('验证: ActionSheet弹窗是否跟随到新页面显示');
      console.info('预期: 弹窗应该在新页面继续显示，可通过点击空白处或按钮关闭');
    } catch (error) {
      console.error('导航异常: ' + JSON.stringify(error));
    }
  }

  private showActionSheet(): void {
    this.getUIContext().showActionSheet({
      title: 'ActionSheet测试 - OVERLAY模式0190',
      subtitle: 'LevelMode:OVERLAY + ImmersiveMode:异常值 + 向下偏移',
      message: '测试OVERLAY + 异常ImmersiveMode + 偏移',
      autoCancel: true,
      levelMode: LevelMode.OVERLAY,
      immersiveMode: -888 as ImmersiveMode, // 异常值
      showInSubWindow: true, // 设置为true以支持页面跟随
      isModal: false, // 设置为false以允许页面切换时保持显示
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
      offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 },
      sheets: [
        { 
          title: '选项1 - OVERLAY跟随', 
          action: () => { 
            console.info('选项1被选择 - 测试页面跟随功能'); 
          } 
        },
        { 
          title: '选项2 - 切换页面', 
          action: () => { 
            console.info('选项2被选择 - 即将切换页面测试跟随');
            this.navigateToHome(); 
          } 
        },
        { 
          title: '选项3 - 关闭弹窗', 
          action: () => { 
            console.info('选项3被选择 - 关闭弹窗'); 
          } 
        }
      ]
    });
  }
}
