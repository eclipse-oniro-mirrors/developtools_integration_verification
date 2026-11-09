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
struct PopupBoxSpecificationsPageDisplay1320 {
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
    setTimeout(() => {
      console.info('自动执行: 显示ShowActionSheet');
      this.showActionSheet();
    }, 1000);
  }

  showActionSheet(): void {
    const uiContext = this.getUIContext();
    uiContext.showActionSheet({
      title: 'ShowActionSheet测试',
      message: '验证EMBEDDED LevelMode + DEFAULT ImmersiveMode + 异常levelUniqueId + isModal=false的行为',
      autoCancel: true,
      confirm: {
        defaultFocus: true,
        value: '确认',
        action: () => {
          console.info('ShowActionSheet确认按钮被点击');
        }
      },
      cancel: () => {
        console.info('ShowActionSheet被取消');
      },
      sheets: [
        {
          title: '选项1',
          action: () => {
            console.info('选项1被点击');
          }
        },
        {
          title: '选项2',
          action: () => {
            console.info('选项2被点击');
          }
        }
      ],
      // 设置EMBEDDED LevelMode + DEFAULT ImmersiveMode + 异常levelUniqueId + isModal=false
      levelMode: LevelMode.EMBEDDED,
      immersiveMode: ImmersiveMode.DEFAULT,
      levelUniqueId: -999, // 异常值
      showInSubWindow: true, // 设置为true以支持页面跟随
      isModal: false, // 设置为false以允许页面交互和跟随
      maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
      alignment: DialogAlignment.Bottom,
      offset: { dx: 0, dy: 0 }
    });
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

        Text('PopupBox规格页面显示测试1320')
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

        Text('3. 设置ImmersiveMode.DEFAULT，设置levelUniqueId为异常值 (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('4. 设置isModal为false (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Button('5. 点击ShowActionSheet')
          .id('button_action_sheet')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .margin({ top: 10, bottom: 10 })
          .onClick(() => {
            this.autoExecuted = true;
            this.showActionSheet();
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
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }
}