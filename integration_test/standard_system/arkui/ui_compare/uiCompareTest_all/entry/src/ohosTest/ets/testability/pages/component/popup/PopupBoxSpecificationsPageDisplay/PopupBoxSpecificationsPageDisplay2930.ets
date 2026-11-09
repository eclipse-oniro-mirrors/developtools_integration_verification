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
struct PopupBoxSpecificationsPageDisplay2930 {
  @State firstDialogShown: boolean = false;
  @State secondDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  @State showTestPage: boolean = false; // 控制显示测试页面还是原页面
  @State firstDialogWasShown: boolean = false; // 记录第一个弹窗是否曾经显示过
  @State secondDialogWasShown: boolean = false; // 记录第二个弹窗是否曾经显示过
  private firstDialogId: number = -1;
  private secondDialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay2930 aboutToAppear');
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
      // 第一个弹窗：showDialog，isModal为false，levelMode为EMBEDDED，immersiveMode为DEFAULT，不跟随页面
      this.firstDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.FirstDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.DEFAULT,
        levelUniqueId: 100, // 正常值
        showInSubWindow: false, // 不跟随页面，页面切换时会消失
        isModal: false, // 不显示蒙层，方便点击第二个dialog
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.TopStart,
        offset: { dx: 50, dy: 150 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('第一个showDialog即将关闭，原因:', dismissAction.reason);
          this.firstDialogShown = false;
          return true;
        }
      });
      this.firstDialogShown = true;
      this.firstDialogWasShown = true;
      console.info('第一个showDialog已显示，dialogId:', this.firstDialogId);
    } catch (error) {
      console.error('显示第一个showDialog失败:', error.message);
    }
  }

  async showSecondDialog(): Promise<void> {
    try {
      // 第二个弹窗：uicontext_openCustomDialog，isModal为true，levelMode为EMBEDDED，UniqueId为异常值，immersiveMode为EXTEND，跟随页面
      this.secondDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.SecondDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.EXTEND,
        levelUniqueId: -999, // 异常值
        showInSubWindow: true, // 跟随页面
        isModal: true, // 显示蒙层，但向下偏移让返回首页按钮露出来
        maskRect: { x: 0, y: 60, width: '100%', height: '80%' }, // 向下偏移，不覆盖顶部导航
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: 0 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('第二个uicontext_openCustomDialog即将关闭，原因:', dismissAction.reason);
          this.secondDialogShown = false;
          return true;
        }
      });
      this.secondDialogShown = true;
      this.secondDialogWasShown = true;
      console.info('第二个uicontext_openCustomDialog已显示，dialogId:', this.secondDialogId);
    } catch (error) {
      console.error('显示第二个uicontext_openCustomDialog失败:', error.message);
    }
  }

  closeFirstDialog(): void {
    if (this.firstDialogId !== -1) {
      promptAction.closeCustomDialog(this.firstDialogId);
      this.firstDialogShown = false;
      this.firstDialogId = -1;
      console.info('第一个showDialog已关闭');
    }
  }

  closeSecondDialog(): void {
    if (this.secondDialogId !== -1) {
      promptAction.closeCustomDialog(this.secondDialogId);
      this.secondDialogShown = false;
      this.secondDialogId = -1;
      console.info('第二个uicontext_openCustomDialog已关闭');
    }
  }

  // 模拟router跳转
  simulateRouterJump(): void {
    console.info('模拟router跳转到新页面');
    
    // 第一个弹窗(showDialog)必须手动关闭，因为它不跟随页面
    if (this.firstDialogShown) {
      this.closeFirstDialog();
    }
    // 第二个弹窗(uicontext_openCustomDialog)保持显示，因为它跟随页面
    
    this.showTestPage = true;
  }

  // 返回原页面
  backToPreviousPage(): void {
    console.info('返回到原页面');
    this.showTestPage = false;
    
    // 恢复弹窗状态：
    // 第一个弹窗(showDialog)需要手动恢复，因为它不跟随页面
    if (this.firstDialogWasShown) {
      setTimeout(async () => {
        await this.showFirstDialog();
      }, 300);
    }
    // 第二个弹窗(uicontext_openCustomDialog)会自动跟随页面显示，无需手动处理
  }

  @Builder
  FirstDialogBuilder() {
    Column() {
      Text('第一个showDialog')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('EMBEDDED + DEFAULT + isModal:false + 正常值')
        .fontSize(12)
        .margin({ bottom: 15 })

      Text('这是第一个showDialog弹窗内容')
        .fontSize(14)
        .margin({ bottom: 20 })

      Row() {
        Button('确认')
          .width(70)
          .height(35)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('第一个showDialog确认按钮被点击');
            this.closeFirstDialog();
          })

        Button('取消')
          .width(70)
          .height(35)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('第一个showDialog取消按钮被点击');
            this.closeFirstDialog();
          })
      }
    }
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 8, color: Color.Gray, offsetX: 0, offsetY: 2 })
    .border({ width: 2, color: Color.Blue })
  }

  @Builder
  SecondDialogBuilder() {
    Column() {
      Text('第二个uicontext_openCustomDialog')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('EMBEDDED + EXTEND + isModal:true + 异常值(-999)')
        .fontSize(12)
        .margin({ bottom: 15 })

      Text('这是第二个uicontext_openCustomDialog弹窗内容')
        .fontSize(14)
        .margin({ bottom: 20 })

      Row() {
        Button('确认')
          .width(70)
          .height(35)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('第二个uicontext_openCustomDialog确认按钮被点击');
            this.closeSecondDialog();
          })

        Button('取消')
          .width(70)
          .height(35)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('第二个uicontext_openCustomDialog取消按钮被点击');
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

        Text('PopupBox规格页面显示测试2930')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 20 })
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#f0f0f0')
      .padding({ left: 10, right: 10 })

      // 主要内容区域
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
        Text('验证同时存在embedded模式下的正常值和异常值的情况')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })
          .textAlign(TextAlign.Center)

        Text('测试步骤：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Text('1. 打开测试hap (已完成)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('2. 设置isModal为false，levelMode为EMBEDDED，UniqueId为正常值，immersiveMode为DEFAULT')
          .fontSize(14)
          .margin({ bottom: 5 })

        Button(this.firstDialogShown ? '第一个showDialog已显示 ✓' : '点击showDialog')
          .id('button_first_dialog')
          .backgroundColor(this.firstDialogShown ? Color.Green : Color.Blue)
          .fontColor(Color.White)
          .width(250)
          .height(40)
          .margin({ bottom: 15 })
          .onClick(async () => {
            if (!this.firstDialogShown) {
              await this.showFirstDialog();
            }
          })

        Text('3. 设置isModal为true，levelMode为EMBEDDED，UniqueId为异常值，immersiveMode为EXTEND')
          .fontSize(14)
          .margin({ bottom: 5 })

        Button(this.secondDialogShown ? '第二个uicontext_openCustomDialog已显示 ✓' : '点击uicontext_openCustomDialog')
          .id('button_second_dialog')
          .backgroundColor(this.secondDialogShown ? Color.Orange : Color.Red)
          .fontColor(Color.White)
          .width(300)
          .height(40)
          .margin({ bottom: 15 })
          .onClick(async () => {
            if (!this.secondDialogShown) {
              await this.showSecondDialog();
            }
          })

        Column() {
          if (this.firstDialogShown) {
            Text('✓ 第一个showDialog已显示 (EMBEDDED + DEFAULT + 正常值)')
              .fontSize(12)
              .fontColor(Color.Blue)
              .margin({ bottom: 5 })
          }

          if (this.secondDialogShown) {
            Text('✓ 第二个uicontext_openCustomDialog已显示 (EMBEDDED + EXTEND + 异常值)')
              .fontSize(12)
              .fontColor(Color.Orange)
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

        Text('4. 点击返回首页/点击router跳转')
          .fontSize(14)
          .margin({ bottom: 10, top: 20 })

        Button('router跳转到测试页面')
          .id('button_router_jump')
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .width(200)
          .height(45)
          .fontSize(16)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.simulateRouterJump();
          })

        Text('预期结果：uicontext_openCustomDialog跟随页面切换显示，showDialog在新页面消失')
          .fontSize(12)
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
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

        Text('2930测试跳转页面')
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

        Text('✓ 第二个弹窗uicontext_openCustomDialog跟随页面显示')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 第一个弹窗showDialog在新页面中消失')
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

        Text('• uicontext_openCustomDialog依然存在（跟随页面）')
          .fontSize(14)
          .fontColor(Color.Green)
          .margin({ bottom: 5 })

        Text('• showDialog重新显示（返回原页面后恢复）')
          .fontSize(14)
          .fontColor(Color.Blue)
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