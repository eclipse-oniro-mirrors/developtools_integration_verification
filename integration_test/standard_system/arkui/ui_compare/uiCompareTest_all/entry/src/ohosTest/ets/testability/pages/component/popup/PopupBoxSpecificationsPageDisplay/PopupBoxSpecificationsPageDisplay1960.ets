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
struct PopupBoxSpecificationsPageDisplay1960 {
  @State maskEnabled: boolean = false;
  @State showGlobalMask: boolean = false;
  @State customDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  private dialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay1960 aboutToAppear');
    // 延迟自动执行测试
    setTimeout(() => {
      this.autoExecuteTest();
    }, 500);
  }

  autoExecuteTest(): void {
    console.info('自动执行: 启用100%mask');
    this.maskEnabled = true;
    this.showGlobalMask = true;
    setTimeout(async () => {
      console.info('自动执行: 显示openCustomDialogWithController');
      await this.showCustomDialogWithController();
    }, 1000);
  }

  async showCustomDialogWithController(): Promise<void> {
    try {
      this.dialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.CustomDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: -999, // 异常值
        levelUniqueId: -999, // 异常值
        showInSubWindow: false,
        isModal: true,
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: 0 },
        onWillDismiss: (dismissAction) => {
          console.info('openCustomDialogWithController即将关闭');
          this.customDialogShown = false;
          return true;
        }
      });
      this.customDialogShown = true;
    } catch (error) {
      console.error('openCustomDialogWithController调用失败: ' + JSON.stringify(error));
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
      Text('openCustomDialogWithController测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('验证EMBEDDED LevelMode + 异常ImmersiveMode + 异常levelUniqueId的行为')
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
            console.info('openCustomDialogWithController确认按钮被点击');
            this.closeCustomDialog();
          })

        Button('取消')
          .width(80)
          .height(40)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('openCustomDialogWithController取消按钮被点击');
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
      url: 'testability/pages/PopupBoxSpecificationsPageDisplay/PopupBoxSpecificationsPageDisplay'
    }).catch((error: Error) => {
      console.error('导航到首页失败: ' + error.message);
    });
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Button('返回首页')
          .id('button_return_home')
          .width(100)
          .height(40)
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .onClick(() => {
            this.navigateToHome();
          })
      }
      .width('100%')
      .height('4.92%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#f0f0f0')

      // 主要内容区域
      Column() {
        Text('openCustomDialogWithController测试用例1960')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text('测试步骤：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Text('1、打开测试hap')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('2、设置LevelMode:EMBEDDED')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('3、设置ImmersiveMode设置为异常值，设置levelUniqueId为异常值')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('4、点击100%mask')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('5、点击openCustomDialogWithController')
          .fontSize(14)
          .margin({ bottom: 20 })

        // 控制按钮区域
        Column() {
          Button('100%mask')
            .id('button_100_mask')
            .width(200)
            .height(50)
            .backgroundColor(this.maskEnabled ? Color.Green : Color.Orange)
            .fontColor(Color.White)
            .margin({ bottom: 10 })
            .onClick(async () => {
              this.autoExecuted = true;
              await this.showCustomDialogWithController();
            })

          Text('预期结果：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          Text('dialog节点为全局窗口顶层，遮罩整个窗口')
            .fontSize(14)
            .fontColor(Color.Red)
            .margin({ bottom: 20 })

          if (this.customDialogShown) {
            Text('openCustomDialogWithController已显示')
              .fontSize(14)
              .fontColor(Color.Green)
              .margin({ top: 10 })
          }

          if (!this.autoExecuted) {
            Button('openCustomDialogWithController')
              .id('button_custom_dialog_controller')
              .width(250)
              .height(50)
              .backgroundColor(Color.Orange)
              .fontColor(Color.White)
              .onClick(async () => {
                await this.showCustomDialogWithController();
              })
          }
        }
        .width('100%')
        .padding(20)
      }
      .layoutWeight(1)
      .padding(20)

      // 全局遮罩层
      if (this.showGlobalMask) {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.3)')
          .position({ x: 0, y: 0 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }
}