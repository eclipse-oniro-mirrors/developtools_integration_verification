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
struct PopupBoxSpecificationsPageDisplay0360 {
  @State alertDialogShown: boolean = false;
  @State offsetEnabled: boolean = false;
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
    console.info('自动执行: 向下偏移已启用');
    this.offsetEnabled = true;
    setTimeout(() => {
      console.info('自动执行: 显示AlertDialog');
      this.showAlertDialog();
    }, 1000);
  }

  showAlertDialog(): void {
    const uiContext = this.getUIContext();
    uiContext.showAlertDialog({
      title: 'AlertDialog测试',
      message: '验证EMBEDDED模式下异常ImmersiveMode + 异常levelUniqueId的偏移行为',
      autoCancel: true,
      primaryButton: {
        value: '确认',
        action: () => {
          console.info('AlertDialog确认按钮被点击');
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
          console.info('AlertDialog取消按钮被点击');
        }
      },
      cancel: () => {
        console.info('AlertDialog被取消');
      },
      onWillDismiss: () => {
        console.info('点击了AlertDialog外的空白区域或其他关闭操作');
        return true; // 允许关闭
      },
      // 设置EMBEDDED模式 + 异常ImmersiveMode + 异常levelUniqueId
      levelMode: LevelMode.EMBEDDED,
      levelUniqueId: -999, // 异常值
      immersiveMode: -888 as ImmersiveMode, // 异常值
      showInSubWindow: true, // 设置为true以支持页面跟随
      isModal: false, // 设置为false以允许页面交互和跟随
      maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 }
    });
    this.alertDialogShown = true;
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

        Text('PopupBox规格页面显示测试0360')
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

        Button('5. 点击AlertDialog')
          .id('button_alert_dialog')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.autoExecuted = true;
            this.showAlertDialog();
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

        if (this.alertDialogShown) {
          Text('AlertDialog已显示')
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
