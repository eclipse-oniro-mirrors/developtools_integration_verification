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
struct PopupBoxSpecificationsPageDisplay0150 {
  @State actionSheetShown: boolean = false;
  @State offsetEnabled: boolean = false;

  aboutToAppear() {
    // 延迟自动执行，给手动测试留出时间
    setTimeout(() => {
      this.autoExecuteTest();
    }, 5000);
  }

  autoExecuteTest(): void {
    // 检查是否已经手动触发过
    if (this.offsetEnabled) {
      console.info('检测到手动操作，跳过自动执行');
      return;
    }
    // 自动点击向下偏移
    setTimeout(() => {
      this.offsetEnabled = true;
      console.info('自动执行: 向下偏移已启用');
      
      // 然后自动显示ActionSheet
      setTimeout(() => {
        this.showActionSheet();
      }, 1000);
    }, 500);
  }

  build() {
    Stack() {
      // 主要内容
      Column() {
        // 顶部导航栏
        Row() {
          Button('返回首页')
            .id('button_return_home')
            .fontSize(16)
            .backgroundColor('#007DFF')
            .fontColor(Color.White)
            .margin(10)
            .onClick(() => {
              console.info('返回首页按钮被点击');
              console.info('点击返回首页按钮');
              console.info('预期: dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页');
              this.navigateToHome();
            })
          
          Blank()
          
          Text('测试页面0150')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin(10)
        }
        .width('100%')
        .height('4.92%')
        .backgroundColor('#F0F0F0')

        // 测试内容区域
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          
          Text('ActionSheet测试 - 0150')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 30 })

          // 步骤4: 点击向下偏移
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
              console.info('ActionSheet将向下偏移100px显示');
            })

          // 步骤5: 点击ActionSheet
          Button('5. 点击ActionSheet')
            .id('button_show_actionsheet')
            .width('80%')
            .height(50)
            .margin(10)
            .backgroundColor('#E74C3C')
            .fontColor(Color.White)
            .onClick(() => {
              console.info('显示ActionSheet，当前配置:');
              console.info('LevelMode: OVERLAY (已内置)');
              console.info('ImmersiveMode: DEFAULT (已内置)');
              console.info('向下偏移: 已启用');
              console.info('预期结果: dialog遮罩蒙层被设置下移，弹窗跟随页面切换');
              this.showActionSheet();
            })

          Text('测试配置说明')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 30, bottom: 10 })

          Column() {
            Text('2. LevelMode: OVERLAY (已内置)')
              .fontSize(14)
              .margin(5)
              .fontColor('#FF6B35')

            Text('3. ImmersiveMode: DEFAULT (已内置)')
              .fontSize(14)
              .margin(5)

            Text('4. 点击向下偏移')
              .fontSize(14)
              .margin(5)
              .fontColor(this.offsetEnabled ? '#4CAF50' : '#666666')

            Text('5. 点击ActionSheet')
              .fontSize(14)
              .margin(5)

            Text('6. 点击返回首页')
              .fontSize(14)
              .margin(5)

            Text('预期结果: dialog遮罩蒙层被设置下移，点击返回首页后，dialog弹窗跟随到首页，点击空白处或者点击按钮能关闭dialog弹窗')
              .fontSize(14)
              .fontColor('#E74C3C')
              .margin({ top: 10 })
              .textAlign(TextAlign.Center)
          }
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .layoutWeight(1)
        .padding(20)
      }
    }
  }

  private navigateToHome(): void {
    router.pushUrl({
      url: 'testability/pages/Index'
    }).catch((error: Error) => {
      console.error('导航失败:', JSON.stringify(error));
    });
  }

  private showActionSheet(): void {
    this.actionSheetShown = true;
    this.getUIContext().showActionSheet({
      title: 'ActionSheet测试 - OVERLAY模式0150',
      subtitle: 'LevelMode:OVERLAY + ImmersiveMode:DEFAULT + 向下偏移',
      message: '测试OVERLAY模式下弹窗的跟随行为',
      autoCancel: true,
      levelMode: LevelMode.OVERLAY, // 设置为OVERLAY模式
      immersiveMode: ImmersiveMode.DEFAULT,
      showInSubWindow: true, // 设置为true以支持页面跟随
      isModal: false, // 设置为false以允许页面切换时保持显示
      maskRect: {
        x: 0,
        y: 0,
        width: '100%',
        height: '100%'
      },
      confirm: {
        defaultFocus: true,
        value: 'Confirm button',
        action: () => {
          console.info('ActionSheet确认按钮被点击');
          console.info('验证: OVERLAY模式弹窗跟随页面切换功能');
          this.actionSheetShown = false;
        }
      },
      cancel: () => {
        console.info('ActionSheet取消');
        this.actionSheetShown = false;
      },
      onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
        console.info(`关闭原因: ${dismissDialogAction.reason}`);
        console.info('ActionSheet即将关闭');
        this.actionSheetShown = false;
        if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
          dismissDialogAction.dismiss();
        }
        if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
          console.info('点击空白区域，弹窗退出 - 符合预期');
          dismissDialogAction.dismiss();
        }
      },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 }, // 根据状态设置偏移
      sheets: [
        {
          title: '选项1 - OVERLAY跟随',
          action: () => {
            console.info('选项1被选择 - 测试OVERLAY页面跟随功能');
            this.actionSheetShown = false;
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
            this.actionSheetShown = false;
          }
        }
      ]
    });
  }
}
