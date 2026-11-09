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

import { LevelMode, ImmersiveMode, router } from '@kit.ArkUI';


@Entry
@Component
struct PopupBoxSpecificationsPageDisplay1750 {
  @State maskEnabled: boolean = false;
  @State showGlobalMask: boolean = false;
  @State showDialogShown: boolean = false;
  @State autoExecuted: boolean = false;

  aboutToAppear(): void {
    setTimeout(() => {
      this.autoExecuteTest();
    }, 5000);
  }

  autoExecuteTest(): void {
    if (this.autoExecuted) {
      console.info('检测到已自动执行，跳过');
      return;
    }
    this.autoExecuted = true;
    console.info('自动执行: 100%遮罩已启用');
    this.maskEnabled = true;
    this.showGlobalMask = true;
    setTimeout(() => {
      console.info('自动执行: 显示showDialog');
      this.showDialog();
    }, 1000);
  }

  showDialog(): void {
    const uiContext = this.getUIContext();
    uiContext.showAlertDialog({
      title: 'showDialog测试',
      message: '验证异常LevelMode + DEFAULT ImmersiveMode的行为',
      autoCancel: true,
      primaryButton: {
        value: '确认',
        action: () => {
          console.info('showDialog确认按钮被点击');
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
          console.info('showDialog取消按钮被点击');
        }
      },
      cancel: () => {
        console.info('showDialog被取消');
      },
      // 设置异常LevelMode + DEFAULT ImmersiveMode
      levelMode: -999 as LevelMode, // 异常值
      immersiveMode: ImmersiveMode.DEFAULT,
      showInSubWindow: false,
      isModal: true,
      maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: 0 }
    });
    this.showDialogShown = true;
  }

  navigateToHome(): void {
    router.pushUrl({
      url: 'testability/pages/Index'
    }).catch((err: Error) => {
      console.error('导航失败:', err.message);
    });
  }

  build(): void {
    Column() {
      // 顶部导航栏
      Row() {
        Button('返回首页')
          .id('button_return_home')
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .margin({ left: 10, right: 10 })
          .onClick(() => {
            this.autoExecuted = true;
            this.navigateToHome();
          })

        Blank()

        Text('PopupBox规格页面显示测试1750')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 20 })
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#f0f0f0')
      .padding({ left: 10, right: 10 })

      // 主要内容区域
      Stack() {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Text('测试步骤：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          Text('1. 打开测试hap (已完成)')
            .fontSize(14)
            .margin({ bottom: 5 })

          Text('2. 设置LevelMode:异常值 (已内置)')
            .fontSize(14)
            .margin({ bottom: 5 })

          Text('3. 设置ImmersiveMode.DEFAULT (已内置)')
            .fontSize(14)
            .margin({ bottom: 5 })

          Button(this.maskEnabled ? '4. 100%遮罩已启用 ✓' : '4. 点击100%mask')
            .id('button_100_mask')
            .backgroundColor(this.maskEnabled ? Color.Green : Color.Blue)
            .fontColor(Color.White)
            .margin({ top: 10, bottom: 10 })
            .onClick(() => {
              this.maskEnabled = true;
              this.showGlobalMask = true;
              this.autoExecuted = true;
            })

          Button('5. 点击showDialog')
            .id('button_show_dialog')
            .backgroundColor(Color.Orange)
            .fontColor(Color.White)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.autoExecuted = true;
              this.showDialog();
            })

          Text('预期结果：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          Text('dialog节点为全局窗口顶层，遮罩整个窗口')
            .fontSize(14)
            .fontColor(Color.Red)
            .textAlign(TextAlign.Center)
            .margin({ left: 20, right: 20 })
        }
        .width('100%')
        .height('100%')
        .padding(20)

        // 全局遮罩
        if (this.showGlobalMask) {
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Text('全局遮罩层')
              .fontSize(24)
              .fontColor(Color.White)
              .margin({ bottom: 20 })

            Button('关闭遮罩')
              .id('button_close_mask')
              .backgroundColor(Color.Red)
              .fontColor(Color.White)
              .margin({ bottom: 10 })
              .onClick(() => {
                this.showGlobalMask = false;
              })

            Button('在遮罩上显示showDialog')
              .id('button_show_dialog_on_mask')
              .backgroundColor(Color.Orange)
              .fontColor(Color.White)
              .onClick(() => {
                this.showDialog();
              })
          }
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.5)')
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}