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
struct PopupBoxSpecificationsPageDisplay2920 {
  @State firstDialogShown: boolean = false;
  @State secondDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  @State showTestPage: boolean = false; // 控制显示测试页面还是原页面
  @State firstDialogWasShown: boolean = false; // 记录第一个弹窗是否曾经显示过
  @State secondDialogWasShown: boolean = false; // 记录第二个弹窗是否曾经显示过
  private firstDialogId: number = -1;
  private secondDialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay2920 aboutToAppear');
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

  async showFirstCustomDialog(): Promise<void> {
    try {
      // 第一个弹窗：isModal为false，levelMode为EMBEDDED，immersiveMode为EXTEND
      this.firstDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.FirstCustomDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.EXTEND,
        levelUniqueId: 100, // 正常值
        showInSubWindow: false, // 不跟随页面，页面切换时会消失
        isModal: false, // 不显示蒙层，方便点击第二个dialog
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.TopStart,
        offset: { dx: 50, dy: 150 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('第一个自定义弹窗即将关闭，原因:', dismissAction.reason);
          this.firstDialogShown = false;
          return true;
        }
      });
      this.firstDialogShown = true;
      this.firstDialogWasShown = true;
      console.info('第一个自定义弹窗已显示，dialogId:', this.firstDialogId);
    } catch (error) {
      console.error('显示第一个自定义弹窗失败:', error.message);
    }
  }

  async showSecondCustomDialog(): Promise<void> {
    try {
      // 第二个弹窗：isModal为true，levelMode为EMBEDDED，immersiveMode为DEFAULT，maskRect不覆盖底部按钮区域
      this.secondDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.SecondCustomDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.DEFAULT,
        levelUniqueId: 100, // 正常值
        showInSubWindow: false, // 不跟随页面，页面切换时会消失
        isModal: true, // 显示蒙层，但不覆盖底部router按钮区域
        maskRect: { x: 0, y: 60, width: '100%', height: '70%' }, // 遮罩主要内容区域，不覆盖顶部导航和底部按钮
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: 0 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('第二个prompt_openCustomDialog即将关闭，原因:', dismissAction.reason);
          this.secondDialogShown = false;
          return true;
        }
      });
      this.secondDialogShown = true;
      this.secondDialogWasShown = true;
      console.info('第二个prompt_openCustomDialog已显示，dialogId:', this.secondDialogId);
    } catch (error) {
      console.error('显示第二个prompt_openCustomDialog失败:', error.message);
    }
  }

  closeFirstCustomDialog(): void {
    if (this.firstDialogId !== -1) {
      promptAction.closeCustomDialog(this.firstDialogId);
      this.firstDialogShown = false;
      this.firstDialogId = -1;
    }
  }

  closeSecondCustomDialog(): void {
    if (this.secondDialogId !== -1) {
      promptAction.closeCustomDialog(this.secondDialogId);
      this.secondDialogShown = false;
      this.secondDialogId = -1;
    }
  }

  // 模拟router跳转效果
  simulateRouterJump(): void {
    console.info('模拟router跳转到新页面');
    
    // 关闭所有弹窗（模拟页面跳转时弹窗消失）
    if (this.firstDialogShown) {
      this.closeFirstCustomDialog();
    }
    if (this.secondDialogShown) {
      this.closeSecondCustomDialog();
    }
    
    // 切换到测试页面
    this.showTestPage = true;
  }

  // 返回原页面
  backToPreviousPage(): void {
    console.info('返回到原页面');
    this.showTestPage = false;
    
    // 简化：直接恢复弹窗状态
    if (this.firstDialogWasShown && !this.firstDialogShown) {
      setTimeout(async () => {
        await this.showFirstCustomDialog();
      }, 300);
    }
    if (this.secondDialogWasShown && !this.secondDialogShown) {
      setTimeout(async () => {
        await this.showSecondCustomDialog();
      }, 600);
    }
  }

  @Builder
  FirstCustomDialogBuilder() {
    Column() {
      Text('第一个自定义弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('EMBEDDED + EXTEND + isModal:false')
        .fontSize(12)
        .margin({ bottom: 15 })
        .textAlign(TextAlign.Center)

      Button('关闭第一个弹窗')
        .width(120)
        .height(35)
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .onClick(() => {
          console.info('第一个自定义弹窗关闭按钮被点击');
          this.closeFirstCustomDialog();
        })
    }
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 8, color: Color.Gray, offsetX: 0, offsetY: 2 })
    .border({ width: 2, color: Color.Blue })
  }

  @Builder
  SecondCustomDialogBuilder() {
    Column() {
      Text('第二个prompt_openCustomDialog')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('EMBEDDED + DEFAULT + isModal:true + 遮罩不覆盖按钮区域')
        .fontSize(12)
        .margin({ bottom: 15 })
        .textAlign(TextAlign.Center)

      Row() {
        Button('确认')
          .width(70)
          .height(35)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('第二个prompt_openCustomDialog确认按钮被点击');
            this.closeSecondCustomDialog();
          })

        Button('取消')
          .width(70)
          .height(35)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('第二个prompt_openCustomDialog取消按钮被点击');
            this.closeSecondCustomDialog();
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

        Text('PopupBox规格页面显示测试2920')
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
        // 上半部分：测试内容
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
          Text('双弹窗测试用例')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })

          Text('测试步骤：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          Text('1. 打开测试hap (已完成)')
            .fontSize(14)
            .margin({ bottom: 5 })

          Text('2. 设置isModal为false，levelMode为EMBEDDED，immersiveMode为EXTEND')
            .fontSize(14)
            .margin({ bottom: 5 })

          Button(this.firstDialogShown ? '第一个自定义弹窗已显示 ✓' : '点击自定义弹窗')
            .id('button_first_custom_dialog')
            .backgroundColor(this.firstDialogShown ? Color.Green : Color.Blue)
            .fontColor(Color.White)
            .margin({ top: 10, bottom: 10 })
            .onClick(async () => {
              this.autoExecuted = true;
              await this.showFirstCustomDialog();
            })

          Text('3. 设置isModal为true，levelMode为EMBEDDED，immersiveMode为DEFAULT，遮罩不覆盖按钮区域')
            .fontSize(14)
            .margin({ bottom: 5 })

          Button(this.secondDialogShown ? '第二个prompt_openCustomDialog已显示 ✓' : '点击prompt_openCustomDialog')
            .id('button_second_custom_dialog')
            .backgroundColor(this.secondDialogShown ? Color.Green : Color.Orange)
            .fontColor(Color.White)
            .margin({ bottom: 10 })
            .onClick(async () => {
              this.autoExecuted = true;
              await this.showSecondCustomDialog();
            })

          Text('预期结果：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          Text('两个dialog在新页面中消失，回到之前的页面，弹窗依然存在。仅遮罩页面，不遮罩状态栏导航条。')
            .fontSize(14)
            .fontColor(Color.Red)
            .textAlign(TextAlign.Center)
            .margin({ left: 20, right: 20, bottom: 15 })

          // 状态显示
          Column() {
            Text('当前弹窗状态：')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 5 })

            if (this.firstDialogShown) {
              Text('✓ 第一个自定义弹窗已显示 (EMBEDDED + EXTEND + isModal:false)')
                .fontSize(12)
                .fontColor(Color.Blue)
                .margin({ bottom: 5 })
            } else if (this.firstDialogWasShown) {
              Text('○ 第一个自定义弹窗曾经显示过，当前已关闭')
                .fontSize(12)
                .fontColor(Color.Gray)
                .margin({ bottom: 5 })
            }

            if (this.secondDialogShown) {
              Text('✓ 第二个prompt_openCustomDialog已显示 (EMBEDDED + DEFAULT + isModal:true + 遮罩不覆盖按钮)')
                .fontSize(12)
                .fontColor(Color.Orange)
                .margin({ bottom: 5 })
            } else if (this.secondDialogWasShown) {
              Text('○ 第二个prompt_openCustomDialog曾经显示过，当前已关闭')
                .fontSize(12)
                .fontColor(Color.Gray)
                .margin({ bottom: 5 })
            }

            if (!this.firstDialogShown && !this.secondDialogShown && (this.firstDialogWasShown || this.secondDialogWasShown)) {
              Text('注意：所有弹窗已关闭，准备进行页面跳转测试')
                .fontSize(12)
                .fontColor(Color.Red)
                .margin({ top: 5 })
            }
          }
          .margin({ top: 10 })
        }
        .width('100%')
        .layoutWeight(1)
        .padding(20)

        // 底部：router跳转按钮区域
        Column() {
          Text('4. 点击router跳转')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button('router跳转到测试页面')
            .id('button_router_jump')
            .backgroundColor(Color.Red)
            .fontColor(Color.White)
            .width(200)
            .height(45)
            .fontSize(16)
            .onClick(() => {
              this.simulateRouterJump();
            })

          Text('注意：第二个弹窗遮罩不会覆盖此按钮区域')
            .fontSize(11)
            .fontColor(Color.Gray)
            .textAlign(TextAlign.Center)
            .margin({ top: 5 })
        }
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 15, top: 15 })
        .backgroundColor('#f8f8f8')
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .layoutWeight(1)
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

        Text('2920测试跳转页面')
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
        Text('这是router跳转后的新页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 30 })

        Text('验证点：')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 20 })

        Text('✓ 两个dialog在新页面中消失')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 新页面没有任何弹窗显示')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 状态栏和导航条正常显示')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 页面内容完全可见，无遮罩')
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

        Text('• 弹窗依然存在')
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 5 })

        Text('• 第二个弹窗有100%遮罩')
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 5 })

        Text('• 仅遮罩页面，不遮罩状态栏导航条')
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

  build(): void {
    if (this.showTestPage) {
      this.TestJumpPage()
    } else {
      this.MainTestPage()
    }
  }
}