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
struct PopupBoxSpecificationsPageDisplay0480 {
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
      title: 'AlertDialog测试0480',
      message: '验证LevelMode异常值，ImmersiveMode.EXTEND情况下的dialog占点',
      autoCancel: true, // 关键：允许点击空白处关闭
      primaryButton: {
        value: '确认',
        action: () => {
          console.info('AlertDialog确认按钮被点击');
          console.info('测试配置完成:');
          console.info('- LevelMode: 异常值');
          console.info('- ImmersiveMode: EXTEND');
          console.info('- 向下偏移: ' + (this.offsetEnabled ? '100px' : '0px'));
          console.info('- 支持空白点击关闭');
          this.alertDialogShown = false;
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
          console.info('AlertDialog取消按钮被点击');
          this.alertDialogShown = false;
        }
      },
      cancel: () => {
        console.info('AlertDialog被取消 - 点击空白区域');
        console.info('空白区域点击功能正常工作');
        this.alertDialogShown = false;
      },
      onWillDismiss: () => {
        console.info('AlertDialog即将关闭 - 检测到空白区域点击或其他关闭操作');
        console.info('空白区域点击功能正常工作');
        this.alertDialogShown = false;
        return true; // 允许关闭
      },
      // 按测试步骤要求设置参数
      levelMode: -999 as LevelMode, // 设置LevelMode:异常值
      immersiveMode: ImmersiveMode.EXTEND, // 设置ImmersiveMode.EXTEND
      showInSubWindow: true, // 支持页面跟随
      isModal: false, // 允许页面交互
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 }, // 向下偏移
      // 添加明显的背景颜色来区分弹窗和页面
      backgroundColor: '#FF6B35', // 橙色背景，便于识别弹窗边界
      cornerRadius: 20,
      borderWidth: 1,
      borderStyle: BorderStyle.Solid,
      borderColor: Color.Blue
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

        Text('PopupBox规格页面显示测试0480')
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

        Text('3. 设置ImmersiveMode.EXTEND (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Column() {
          Text('AlertDialog测试配置')
            .fontSize(12)
            .fontColor('#4CAF50')
            .margin(2)
          
          Text('autoCancel=true + onWillDismiss 支持空白点击')
            .fontSize(12)
            .fontColor('#2196F3')
            .margin(2)
            
          Text('showInSubWindow=true 支持页面跟随')
            .fontSize(12)
            .fontColor('#FF6B35')
            .margin(2)
            
          Text('橙色AlertDialog便于识别占比')
            .fontSize(12)
            .fontColor('#FF9800')
            .margin(2)
        }
        .alignItems(HorizontalAlign.Center)
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

        Text('此时dialog可以被层被覆盖控制，切换界面，dialog会跟随到新页面，点击空白处或点击按钮能够关闭dialog弹窗')
          .fontSize(14)
          .fontColor(Color.Red)
          .textAlign(TextAlign.Center)
          .margin({ left: 20, right: 20 })

        Text('注意: AlertDialog设置autoCancel=true支持空白点击关闭')
          .fontSize(12)
          .fontColor('#4CAF50')
          .textAlign(TextAlign.Center)
          .margin({ top: 10, left: 20, right: 20 })

        if (this.alertDialogShown) {
          Text('AlertDialog已显示 - 可点击空白处关闭')
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
    .backgroundColor('#E3F2FD') // 浅蓝色页面背景，与弹窗形成对比
  }
}
