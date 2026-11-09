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
struct PopupBoxSpecificationsPageDisplay0250 {
  @State actionSheetShown: boolean = false;
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
      console.info('自动执行: 显示ActionSheet');
      this.showActionSheet();
    }, 1000);
  }

  showActionSheet(): void {
    const uiContext = this.getUIContext();
    uiContext.showActionSheet({
      title: 'ActionSheet测试',
      message: '验证双异常值的偏移行为',
      autoCancel: true,
      confirm: {
        defaultFocus: true,
        value: '确认',
        action: () => {
          console.info('ActionSheet确认按钮被点击');
          console.info('配置: showInSubWindow=true, isModal=false 支持页面跟随');
        }
      },
      cancel: () => {
        console.info('ActionSheet被取消');
      },
      onWillDismiss: () => {
        console.info('点击了ActionSheet外的空白区域或其他关闭操作');
        return true; // 允许关闭
      },
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
        }
      ],
      // 设置双异常值
      levelMode: -999 as LevelMode, // 异常值
      immersiveMode: -888 as ImmersiveMode, // 异常值
      showInSubWindow: true, // 启用子窗口显示，支持页面跟随
      isModal: false, // 非模态，支持页面跟随
      maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 }
    });
    this.actionSheetShown = true;
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

        Text('PopupBox规格页面显示测试0250')
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

        Text('2. 设置LevelMode:异常值 (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('3. 设置ImmersiveMode设置为异常值 (已内置)')
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

        Button('5. 点击ActionSheet')
          .id('button_show_actionsheet')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
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

        Text('此时dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗')
          .fontSize(14)
          .fontColor(Color.Red)
          .textAlign(TextAlign.Center)
          .margin({ left: 20, right: 20 })

        if (this.actionSheetShown) {
          Text('ActionSheet已显示')
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
