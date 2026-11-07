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

import { LevelMode, ImmersiveMode, router, promptAction } from '@kit.ArkUI';



@Entry
@Component
struct PopupBoxSpecificationsPageDisplay2250 {
  @State maskEnabled: boolean = false;
  @State showGlobalMask: boolean = false;
  @State customDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  private dialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay2250 aboutToAppear');
    // 延迟自动执行测试
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
    console.info('自动执行: 启用100%mask');
    this.maskEnabled = true;
    this.showGlobalMask = true;
    setTimeout(async () => {
      console.info('自动执行: 显示uiContext_openCustomDialog');
      await this.showCustomDialog();
    }, 1000);
  }

  async showCustomDialog(): Promise<void> {
    try {
      this.dialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.CustomDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.EXTEND,
        levelUniqueId: -999, // 异常值
        showInSubWindow: false,
        isModal: true,
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: 0 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('uiContext_openCustomDialog即将关闭，原因:', dismissAction.reason);
          this.customDialogShown = false;
          return true;
        }
      });
      this.customDialogShown = true;
    } catch (error) {
      console.error('显示uiContext_openCustomDialog失败:', error.message);
    }
  }

  closeCustomDialog(): void {
    if (this.dialogId !== -1) {
      promptAction.closeCustomDialog(this.dialogId);
      this.customDialogShown = false;
      this.dialogId = -1;
    }
  }

  @Builder
  CustomDialogBuilder() {
    Column() {
      Text('uiContext_openCustomDialog测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('验证EMBEDDED LevelMode + EXTEND ImmersiveMode + 异常levelUniqueId的行为')
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      Row() {
        Button('确认')
          .width(80)
          .height(40)
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('uiContext_openCustomDialog确认按钮被点击');
            this.closeCustomDialog();
          })

        Button('取消')
          .width(80)
          .height(40)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('uiContext_openCustomDialog取消按钮被点击');
            this.closeCustomDialog();
          })
      }
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 2 })
  }

  navigateToHome(): void {
    router.pushUrl({
      url: 'testability/pages/Index'
    }).catch((error: Error) => {
      console.error('导航到首页失败: ' + error.message);
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

        Text('PopupBox规格页面显示测试2250')
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

          Text('2. 设置LevelMode:EMBEDDED (已内置)')
            .fontSize(14)
            .margin({ bottom: 5 })

          Text('3. 设置ImmersiveMode.EXTEND，设置levelUniqueId为异常值 (已内置)')
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

          Button('5. 点击uiContext_openCustomDialog')
            .id('button_custom_dialog')
            .backgroundColor(Color.Orange)
            .fontColor(Color.White)
            .margin({ bottom: 10 })
          .onClick(async () => {
            this.autoExecuted = true;
            await this.showCustomDialog();
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

            Button('在遮罩上显示uiContext_openCustomDialog')
              .id('button_custom_dialog_on_mask')
              .backgroundColor(Color.Orange)
              .fontColor(Color.White)
              .onClick(async () => {
                await this.showCustomDialog();
              })

            if (this.customDialogShown) {
              Text('uiContext_openCustomDialog已显示')
                .fontSize(14)
                .fontColor(Color.Green)
                .margin({ top: 10 })
            }
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