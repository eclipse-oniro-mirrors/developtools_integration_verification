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
struct PopupBoxSpecificationsPageDisplay2710 {
  @State offsetEnabled: boolean = false;
  @State customDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  private dialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay2710 aboutToAppear');
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
    console.info('自动执行: 向下偏移已启用');
    this.offsetEnabled = true;
    setTimeout(async () => {
      console.info('自动执行: 显示uiContext_presentCustomDialog');
      await this.showPresentCustomDialog();
    }, 1000);
  }

  async showPresentCustomDialog(): Promise<void> {
    try {
      // 使用promptAction.openCustomDialog实现presentCustomDialog功能
      this.dialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.CustomDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: -999, // 异常值
        levelUniqueId: -999, // 异常值
        showInSubWindow: true, // 允许页面跟随
        isModal: false, // 允许与底层页面交互
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('uiContext_presentCustomDialog即将关闭，原因:', dismissAction.reason);
          this.customDialogShown = false;
          return true;
        }
      });
      this.customDialogShown = true;
    } catch (error) {
      console.error('显示uiContext_presentCustomDialog失败:', error.message);
    }
  }

  closePresentCustomDialog(): void {
    if (this.dialogId !== -1) {
      promptAction.closeCustomDialog(this.dialogId);
      this.customDialogShown = false;
      this.dialogId = -1;
    }
  }

  @Builder
  CustomDialogBuilder() {
    Column() {
      Text('uiContext_presentCustomDialog测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('验证EMBEDDED LevelMode + 异常ImmersiveMode + 异常levelUniqueId + 向下偏移的行为')
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
            console.info('uiContext_presentCustomDialog确认按钮被点击');
            this.closePresentCustomDialog();
          })

        Button('取消')
          .width(80)
          .height(40)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('uiContext_presentCustomDialog取消按钮被点击');
            this.closePresentCustomDialog();
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

        Text('PopupBox规格页面显示测试2710')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 20 })
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#f0f0f0')
      .padding({ left: 10, right: 10 })

      // 主要内容区域
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

        Text('3. 设置ImmersiveMode设置为异常值，设置levelUniqueId为异常值 (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Button(this.offsetEnabled ? '4. 向下偏移已启用 ✓' : '4. 点击向下偏移')
          .id('button_offset_down')
          .backgroundColor(this.offsetEnabled ? Color.Green : Color.Blue)
          .fontColor(Color.White)
          .margin({ top: 10, bottom: 10 })
          .onClick(() => {
            this.offsetEnabled = true;
            this.autoExecuted = true;
          })

        Button('5. 点击uiContext_presentCustomDialog')
          .id('button_present_custom_dialog')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
          .onClick(async () => {
            this.autoExecuted = true;
            await this.showPresentCustomDialog();
          })

        Text('6. 点击最上方的返回首页')
          .fontSize(14)
          .margin({ bottom: 20 })

        Text('预期结果：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Text('切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出')
          .fontSize(14)
          .fontColor(Color.Red)
          .textAlign(TextAlign.Center)
          .margin({ left: 20, right: 20 })

        if (this.customDialogShown) {
          Text('uiContext_presentCustomDialog已显示')
            .fontSize(14)
            .fontColor(Color.Green)
            .margin({ top: 10 })
        }
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }
}