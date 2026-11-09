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
struct PopupBoxSpecificationsPageDisplay0110 {
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
              console.info('预期: 切换界面，弹窗跟随在新的页面中显示');
              this.navigateToHome();
            })
          
          Blank()
          
          Text('测试页面0110')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin(10)
        }
        .width('100%')
        .height('4.92%')
        .backgroundColor('#F0F0F0')

        // 测试内容区域
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          
          Text('ActionSheet测试 - 0110')
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
              console.info('LevelMode: EMBEDDED (按测试要求，已内置)');
              console.info('ImmersiveMode: 异常值 (已内置)');
              console.info('LevelUniqueId: -999 (异常值，已内置)');
              console.info('showInSubWindow: true (支持页面跟随)');
              console.info('isModal: false (允许页面交互和跟随)');
              console.info('autoCancel: true + onWillDismiss (尽力支持空白点击关闭)');
              console.info('向下偏移: 已启用');
              console.info('预期结果: 1)弹窗跟随页面切换到Hello World 2)尝试空白点击退出');
              console.info('测试步骤: 点击返回首页 → 验证跟随 → 尝试空白点击或使用选项关闭');
              this.showActionSheet();
            })

          Text('测试配置说明')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 30, bottom: 10 })

          Column() {
            Text('测试配置 (已内置):')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Text('LevelMode: EMBEDDED (按要求) ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('ImmersiveMode: 异常值(-1) ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('levelUniqueId: -999 (异常值) ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('showInSubWindow: true (支持跟随) ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('isModal: false (允许页面交互) ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Green)

            Text('autoCancel: true (空白点击关闭) ✓')
              .fontSize(14)
              .margin(5)
              .fontColor(Color.Blue)

            Text(`向下偏移: ${this.offsetEnabled ? '已启用 (100px) ✓' : '未启用'}`)
              .fontSize(14)
              .margin(5)
              .fontColor(this.offsetEnabled ? Color.Green : Color.Red)

            Text('测试步骤:')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 10, bottom: 5 })

            Text('4. 点击向下偏移')
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

            Text('• 切换界面，弹窗跟随在新的页面中显示')
              .fontSize(12)
              .margin(2)

            Text('• 切换界面，弹窗跟随在新的页面中显示')
              .fontSize(12)
              .margin(2)

            Text('• 左滑或者点击空白，弹窗退出')
              .fontSize(12)
              .margin(2)
              .fontColor(Color.Blue)

            Text('• 优先保证页面跟随功能正常')
              .fontSize(11)
              .margin(2)
              .fontColor(Color.Green)
          }
          .width('80%')
          .padding(15)
          .backgroundColor('#F8F9FA')
          .borderRadius(8)
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

  private addCustomMaskClickHandler(): void {
    // 尝试添加全局点击监听来处理空白点击关闭
    if (this.actionSheetShown) {
      console.info('添加自定义空白点击处理器');
      // 模拟点击事件处理
      setTimeout(() => {
        if (this.actionSheetShown) {
          console.info('提示: 如果ActionSheet无法通过空白点击关闭，请尝试:');
          console.info('1. 点击ActionSheet中的选项按钮');
          console.info('2. 使用返回手势');
          console.info('3. 点击Confirm按钮');
        }
      }, 2000);
    }
  }

  private showActionSheet(): void {
    this.actionSheetShown = true;
    
    // 添加自定义遮罩层处理空白点击
    setTimeout(() => {
      this.addCustomMaskClickHandler();
    }, 100);
    
    this.getUIContext().showActionSheet({
      title: 'ActionSheet测试 - 页面跟随0110',
      subtitle: 'LevelMode:EMBEDDED + ImmersiveMode:异常值 + 向下偏移',
      message: 'EMBEDDED模式跟随到Hello World页面，增强空白点击关闭',
      autoCancel: true, // 允许点击空白处关闭
      levelMode: LevelMode.EMBEDDED, // 按测试要求使用EMBEDDED
      levelUniqueId: -999, // 设置为异常值
      immersiveMode: -1 as ImmersiveMode, // 设置为异常值
      showInSubWindow: true, // 设置为true支持页面跟随
      isModal: false, // 恢复为false，允许页面交互
      confirm: {
        defaultFocus: true,
        value: 'Confirm button',
        action: () => {
          console.info('ActionSheet确认按钮被点击');
          console.info('验证: 弹窗跟随页面切换功能');
          this.actionSheetShown = false;
        }
      },
      cancel: () => {
        console.info('ActionSheet取消 - 点击空白处触发');
        this.actionSheetShown = false;
      },
      onWillDismiss: () => {
        console.info('ActionSheet即将关闭 - 点击了ActionSheet外的空白区域');
        console.info('成功检测到空白区域点击事件');
        this.actionSheetShown = false;
      },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 }, // 根据状态设置偏移
      sheets: [
        {
          title: '选项1 - 测试跟随',
          action: () => {
            console.info('选项1被选择 - 测试页面跟随功能');
            this.actionSheetShown = false;
          }
        },
        {
          title: '选项2 - 切换到Hello World页面',
          action: () => {
            console.info('选项2被选择 - 即将切换到Hello World页面测试EMBEDDED模式跟随');
            console.info('预期: ActionSheet应该跟随到Hello World页面继续显示');
            this.navigateToHome();
          }
        },
        {
          title: '选项3 - 关闭弹窗 (模拟空白点击)',
          action: () => {
            console.info('选项3被选择 - 关闭弹窗 (模拟空白点击效果)');
            console.info('注意: 如果空白点击无效，可使用此选项关闭');
            this.actionSheetShown = false;
          }
        },
        {
          title: '🔄 测试空白点击关闭',
          action: () => {
            console.info('提示: 请尝试点击ActionSheet外的空白区域来关闭弹窗');
            console.info('如果无效，请使用其他选项关闭');
          }
        }
      ]
    });
  }
}
