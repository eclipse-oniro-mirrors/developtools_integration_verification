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
struct PopupBoxSpecificationsPageDisplay0050 {
  @State maskEnabled: boolean = false;
  @State actionSheetShown: boolean = false;

  aboutToAppear() {
    // 延迟自动执行，给手动测试留出时间
    setTimeout(() => {
      this.autoExecuteTest();
    }, 5000); // 增加到5秒，让手动测试有足够时间
  }

  autoExecuteTest(): void {
    // 检查是否已经手动触发过
    if (this.maskEnabled) {
      console.info('检测到手动操作，跳过自动执行');
      return;
    }
    // 自动点击100%mask
    setTimeout(() => {
      this.maskEnabled = true;
      console.info('自动执行: 100%遮罩已启用');
      
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
              console.info('预期: 切换界面，弹窗跟随在新的页面中显示');
              this.navigateToHome();
            })
          
          Blank()
          
          Text('测试页面0050')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin(10)
        }
        .width('100%')
        .height('4.92%')
        .backgroundColor('#F0F0F0')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)

        // 测试步骤区域
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          
          // 步骤4: 点击100%mask
          Button(this.maskEnabled ? '4. 100%遮罩已启用 ✓' : '4. 点击100%mask')
            .id('button_100_mask')
            .width('80%')
            .height(50)
            .margin(10)
            .backgroundColor(this.maskEnabled ? '#4CAF50' : '#8E44AD')
            .fontColor(Color.White)
            .onClick(() => {
              this.maskEnabled = true;
              console.info('100%遮罩已启用');
              console.info('预期效果: 遮罩将覆盖整个窗口');
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
              console.info('LevelMode: EMBEDDED (已内置)');
              console.info('showInSubWindow: true (已内置)');
              console.info('isModal: false (已内置)');
              console.info('ImmersiveMode: DEFAULT (已内置)');
              console.info('LevelUniqueId: 正常值 (已内置)');
              console.info('100%遮罩: 已启用');
              console.info('预期结果: embedded只在非子窗上显示，设置showInSubWindow为true后不生效');
              
              this.actionSheetShown = true;
              this.showActionSheet();
            })

          // 显示当前状态
          Column() {
            Text('测试配置 (已内置):')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 20, bottom: 10 })

            Text('LevelMode: EMBEDDED ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('showInSubWindow: true ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('isModal: false ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('ImmersiveMode: DEFAULT ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('LevelUniqueId: 正常值 ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text(`100%遮罩: ${this.maskEnabled ? '已启用 ✓' : '未启用'}`)
              .fontSize(14)
              .margin(5)
              .fontColor(this.maskEnabled ? Color.Green : Color.Red)

            Text(`ActionSheet: ${this.actionSheetShown ? '已显示 ✓' : '未显示'}`)
              .fontSize(14)
              .margin(5)
              .fontColor(this.actionSheetShown ? Color.Green : Color.Red)

            Text('测试步骤:')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 10, bottom: 5 })

            Text('4. 点击100%mask')
              .fontSize(12)
              .margin(2)

            Text('5. 点击ActionSheet')
              .fontSize(12)
              .margin(2)

            Text('6. 点击返回首页 (验证跟随)')
              .fontSize(12)
              .margin(2)

            Text('预期结果:')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 10, bottom: 5 })

            Text('embedded只在非子窗上显示')
              .fontSize(12)
              .margin(2)
              .fontColor(Color.Orange)

            Text('showInSubWindow=true后不生效')
              .fontSize(12)
              .margin(2)
              .fontColor(Color.Orange)
          }
          .width('80%')
          .padding(15)
          .margin({ top: 20 })
          .backgroundColor('#F8F9FA')
          .borderRadius(8)

        }
        .width('100%')
        .layoutWeight(1)

      }
      .width('100%')
      .height('100%')

    }
    .width('100%')
    .height('100%')
  }

  private showActionSheet(): void {
    this.getUIContext().showActionSheet({
      title: 'ActionSheet测试 - 子窗口配置',
      subtitle: 'LevelMode:EMBEDDED + showInSubWindow:true + isModal:false',
      message: '测试embedded在子窗口配置下的行为',
      autoCancel: true,
      levelMode: LevelMode.EMBEDDED,
      levelUniqueId: 123456, // 设置为正常值
      immersiveMode: ImmersiveMode.DEFAULT,
      showInSubWindow: true, // 设置为true
      isModal: false, // 设置为false
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
          console.info('验证: embedded在子窗口配置下的显示效果');
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
      offset: { dx: 0, dy: 0 },
      sheets: [
        {
          title: '选项1 - 测试子窗口',
          action: () => {
            console.info('选项1被选择 - 测试子窗口配置效果');
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

  private navigateToHome(): void {
    try {
      // 使用pushUrl方法导航到首页
      router.pushUrl({
        url: 'testability/pages/Index'
      });
      console.info('成功导航到首页');
      console.info('验证: 弹窗是否跟随到新页面显示');
    } catch (error) {
      console.error('导航异常: ' + JSON.stringify(error));
    }
  }
}
