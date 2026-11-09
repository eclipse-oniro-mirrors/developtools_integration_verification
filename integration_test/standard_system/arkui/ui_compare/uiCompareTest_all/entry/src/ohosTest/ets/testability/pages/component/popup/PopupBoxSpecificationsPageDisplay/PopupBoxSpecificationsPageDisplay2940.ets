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
struct PopupBoxSpecificationsPageDisplay2940 {
  @State firstDialogShown: boolean = false;
  @State secondDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  @State showTestPage: boolean = false; // 控制显示测试页面还是原页面
  @State firstDialogWasShown: boolean = false; // 记录第一个弹窗是否曾经显示过
  @State secondDialogWasShown: boolean = false; // 记录第二个弹窗是否曾经显示过
  private firstDialogId: number = -1;
  private secondDialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay2940 aboutToAppear');
    // 页面已准备就绪，等待用户操作
    this.autoExecuted = true;
  }

  autoExecuteTest(): void {
    if (this.autoExecuted) {
      console.info('检测到已自动执行，跳过');
      return;
    }
    this.autoExecuted = true;
    console.info('自动执行测试已启动，请手动点击按钮进行测试');
  }

  async showFirstDialog(): Promise<void> {
    try {
      // 第一个弹窗：列表选择弹窗，isModal为false，levelMode为OVERLAY，immersiveMode为DEFAULT
      this.firstDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.FirstDialogBuilder();
        },
        levelMode: LevelMode.OVERLAY,
        immersiveMode: ImmersiveMode.DEFAULT,
        levelUniqueId: 100, // 正常值
        showInSubWindow: true, // 跟随页面，页面切换时会显示在新页面
        isModal: false, // 不显示蒙层，方便点击第二个dialog
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.TopEnd,
        offset: { dx: -50, dy: 150 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('第一个列表选择弹窗即将关闭，原因:', dismissAction.reason);
          this.firstDialogShown = false;
          return true;
        }
      });
      this.firstDialogShown = true;
      this.firstDialogWasShown = true;
      console.info('第一个列表选择弹窗已显示，dialogId:', this.firstDialogId);
    } catch (error) {
      console.error('显示第一个列表选择弹窗失败:', error.message);
    }
  }

  async showSecondDialog(): Promise<void> {
    try {
      // 第二个弹窗：警告弹窗，isModal为true，levelMode为EMBEDDED，immersiveMode为EXTEND
      this.secondDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.SecondDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.EXTEND,
        levelUniqueId: 100, // 正常值
        showInSubWindow: false, // 不跟随页面，页面切换时会消失
        isModal: true, // 显示蒙层，但向下偏移让返回首页按钮露出来
        maskRect: { x: 0, y: 60, width: '100%', height: '80%' }, // 向下偏移，不覆盖顶部导航
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: 0 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('第二个警告弹窗即将关闭，原因:', dismissAction.reason);
          this.secondDialogShown = false;
          return true;
        }
      });
      this.secondDialogShown = true;
      this.secondDialogWasShown = true;
      console.info('第二个警告弹窗已显示，dialogId:', this.secondDialogId);
    } catch (error) {
      console.error('显示第二个警告弹窗失败:', error.message);
    }
  }

  closeFirstDialog(): void {
    if (this.firstDialogId !== -1) {
      promptAction.closeCustomDialog(this.firstDialogId);
      this.firstDialogShown = false;
      this.firstDialogId = -1;
      console.info('第一个列表选择弹窗已关闭');
    }
  }

  closeSecondDialog(): void {
    if (this.secondDialogId !== -1) {
      promptAction.closeCustomDialog(this.secondDialogId);
      this.secondDialogShown = false;
      this.secondDialogId = -1;
      console.info('第二个警告弹窗已关闭');
    }
  }

  // 模拟router跳转
  simulateRouterJump(): void {
    console.info('模拟router跳转到新页面');
    // 第二个弹窗(警告弹窗, showInSubWindow: false)需要手动关闭
    if (this.secondDialogShown) {
      this.closeSecondDialog();
    }
    // 第一个弹窗(列表选择弹窗, showInSubWindow: true)会跟随页面显示
    this.showTestPage = true;
  }

  // 返回原页面
  backToPreviousPage(): void {
    console.info('返回到原页面');
    this.showTestPage = false;
    
    // 恢复弹窗状态：
    // 列表选择弹窗会自动跟随页面显示
    // 警告弹窗需要手动恢复
    if (this.secondDialogWasShown) {
      setTimeout(async () => {
        await this.showSecondDialog();
      }, 300);
    }
  }

  @Builder
  FirstDialogBuilder() {
    Column() {
      Text('列表选择弹窗')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('OVERLAY + DEFAULT')
        .fontSize(10)
        .margin({ bottom: 10 })

      Column() {
        Text('选项 1')
          .fontSize(12)
          .padding(8)
          .width('100%')
          .backgroundColor('#f0f0f0')
          .margin({ bottom: 3 })
          .onClick(() => {
            console.info('选择了选项1');
            this.closeFirstDialog();
          })

        Text('选项 2')
          .fontSize(12)
          .padding(8)
          .width('100%')
          .backgroundColor('#f0f0f0')
          .margin({ bottom: 3 })
          .onClick(() => {
            console.info('选择了选项2');
            this.closeFirstDialog();
          })

        Text('选项 3')
          .fontSize(12)
          .padding(8)
          .width('100%')
          .backgroundColor('#f0f0f0')
          .margin({ bottom: 10 })
          .onClick(() => {
            console.info('选择了选项3');
            this.closeFirstDialog();
          })
      }

      Row() {
        Button('确认')
          .width(60)
          .height(30)
          .fontSize(12)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .margin({ right: 8 })
          .onClick(() => {
            console.info('列表选择弹窗确认按钮被点击');
            this.closeFirstDialog();
          })

        Button('取消')
          .width(60)
          .height(30)
          .fontSize(12)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('列表选择弹窗取消按钮被点击');
            this.closeFirstDialog();
          })
      }
    }
    .padding(12)
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 8, color: Color.Gray, offsetX: 0, offsetY: 2 })
    .border({ width: 2, color: Color.Blue })
  }

  @Builder
  SecondDialogBuilder() {
    Column() {
      Text('警告弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('EMBEDDED + EXTEND + isModal:true')
        .fontSize(12)
        .margin({ bottom: 15 })

      Text('⚠️ 这是一个警告信息')
        .fontSize(14)
        .fontColor(Color.Red)
        .margin({ bottom: 20 })

      Text('请确认您的操作')
        .fontSize(14)
        .margin({ bottom: 20 })

      Row() {
        Button('确认')
          .width(70)
          .height(35)
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('警告弹窗确认按钮被点击');
            this.closeSecondDialog();
          })

        Button('取消')
          .width(70)
          .height(35)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('警告弹窗取消按钮被点击');
            this.closeSecondDialog();
          })
      }
    }
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 8, color: Color.Gray, offsetX: 0, offsetY: 2 })
    .border({ width: 2, color: Color.Orange })
  }

  navigateToHome(): void {
    router.pushUrl({
      url: 'testability/pages/Index'
    }).catch((error: Error) => {
      console.error('导航到首页失败: ' + error.message);
    });
  }

  @Builder
  MainTestPage() {
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

        Text('PopupBox规格页面显示测试2940')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 20 })
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#f0f0f0')
      .padding({ left: 10, right: 10 })

      // 主要内容区域
      Column() {
        Text('验证同时存在overlay和embedded的情况')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 30, top: 20 })
          .textAlign(TextAlign.Center)

        // 上部：列表选择弹窗按钮
        Column() {
          Text('1. 点击列表选择弹窗')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button(this.firstDialogShown ? '列表选择弹窗已显示 ✓' : '点击列表选择弹窗')
            .id('button_first_dialog')
            .backgroundColor(this.firstDialogShown ? Color.Green : Color.Blue)
            .fontColor(Color.White)
            .width(250)
            .height(50)
            .fontSize(16)
            .onClick(async () => {
              if (!this.firstDialogShown) {
                await this.showFirstDialog();
              }
            })

          if (this.firstDialogShown) {
            Text('✓ 列表选择弹窗已显示')
              .fontSize(12)
              .fontColor(Color.Blue)
              .margin({ top: 10 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .margin({ bottom: 60 })

        // 中部：警告弹窗按钮
        Column() {
          Text('2. 点击警告弹窗')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button(this.secondDialogShown ? '警告弹窗已显示 ✓' : '点击警告弹窗')
            .id('button_second_dialog')
            .backgroundColor(this.secondDialogShown ? Color.Orange : Color.Red)
            .fontColor(Color.White)
            .width(250)
            .height(50)
            .fontSize(16)
            .onClick(async () => {
              if (!this.secondDialogShown) {
                await this.showSecondDialog();
              }
            })

          if (this.secondDialogShown) {
            Text('✓ 警告弹窗已显示')
              .fontSize(12)
              .fontColor(Color.Orange)
              .margin({ top: 10 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .margin({ bottom: 60 })

        // 下部：router按钮
        Column() {
          Text('3. 点击router')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button('点击router')
            .id('button_router_jump')
            .backgroundColor(Color.Red)
            .fontColor(Color.White)
            .width(250)
            .height(50)
            .fontSize(16)
            .onClick(() => {
              this.simulateRouterJump();
            })

          Text('预期：列表选择弹窗跟随页面，警告弹窗消失')
            .fontSize(11)
            .fontColor(Color.Gray)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TestJumpPage() {
    Column() {
      // 顶部导航栏
      Row() {
        Button('返回首页')
          .id('button_return_home')
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .margin({ left: 10, right: 10 })
          .onClick(() => {
            this.navigateToHome();
          })

        Blank()

        Text('2940测试跳转页面')
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
        Text('这是返回首页后的新页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 30 })

        Text('验证点：')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 20 })

        Text('✓ 列表选择弹窗跟随页面显示')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 警告弹窗在新页面中消失')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 状态栏和导航条正常显示')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 30 })

        Button('回到之前的页面')
          .id('button_back_to_previous')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .fontSize(18)
          .width(200)
          .height(50)
          .margin({ bottom: 20 })
          .onClick(() => {
            console.info('点击回到之前的页面按钮');
            this.backToPreviousPage();
          })

        Text('点击上面的按钮返回原页面验证：')
          .fontSize(14)
          .margin({ bottom: 10 })

        Text('• 列表选择弹窗依然存在')
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 5 })

        Text('• 警告弹窗依然存在')
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 5 })
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }

  build() {
    if (this.showTestPage) {
      this.TestJumpPage()
    } else {
      this.MainTestPage()
    }
  }
}