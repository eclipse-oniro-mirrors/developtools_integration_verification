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
struct PopupBoxSpecificationsPageDisplay2950 {
  @State pageLevelDialogShown: boolean = false; // 页面级dialog状态
  @State nonPageLevelDialogShown: boolean = false; // 非页面级dialog状态
  @State autoExecuted: boolean = false;
  @State showTestPage: boolean = false; // 控制显示测试页面还是原页面
  @State pageLevelDialogWasShown: boolean = false; // 记录页面级弹窗是否曾经显示过
  @State nonPageLevelDialogWasShown: boolean = false; // 记录非页面级弹窗是否曾经显示过
  private pageLevelDialogId: number = -1;
  private nonPageLevelDialogId: number = -1;

  aboutToAppear(): void {
    console.info('PopupBoxSpecificationsPageDisplay2950 aboutToAppear');
    // 页面已准备就绪，等待用户操作
    this.autoExecuted = true;
  }

  async showPageLevelDialog(): Promise<void> {
    try {
      // 页面级dialog：showInSubWindow为false，不跟随页面
      this.pageLevelDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.PageLevelDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.DEFAULT,
        levelUniqueId: 100,
        showInSubWindow: false, // 页面级：不跟随页面，跳转后不显示在新页面
        isModal: false, // 不显示蒙层，方便点击非页面级dialog
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: 0 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('页面级dialog即将关闭，原因:', dismissAction.reason);
          this.pageLevelDialogShown = false;
          return true;
        }
      });
      this.pageLevelDialogShown = true;
      this.pageLevelDialogWasShown = true;
      console.info('页面级dialog已显示，dialogId:', this.pageLevelDialogId);
    } catch (error) {
      console.error('显示页面级dialog失败:', error.message);
    }
  }

  async showNonPageLevelDialog(): Promise<void> {
    try {
      // 非页面级dialog：showInSubWindow为true，跟随页面
      this.nonPageLevelDialogId = await promptAction.openCustomDialog({
        builder: () => {
          this.NonPageLevelDialogBuilder();
        },
        levelMode: LevelMode.EMBEDDED,
        immersiveMode: ImmersiveMode.DEFAULT,
        levelUniqueId: 100,
        showInSubWindow: true, // 非页面级：跟随页面，跳转后显示在新页面
        isModal: false,
        maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
        alignment: DialogAlignment.TopStart,
        offset: { dx: 20, dy: 100 },
        autoCancel: true,
        onWillDismiss: (dismissAction) => {
          console.info('非页面级dialog即将关闭，原因:', dismissAction.reason);
          this.nonPageLevelDialogShown = false;
          return true;
        }
      });
      this.nonPageLevelDialogShown = true;
      this.nonPageLevelDialogWasShown = true;
      console.info('非页面级dialog已显示，dialogId:', this.nonPageLevelDialogId);
    } catch (error) {
      console.error('显示非页面级dialog失败:', error.message);
    }
  }

  closePageLevelDialog(): void {
    if (this.pageLevelDialogId !== -1) {
      promptAction.closeCustomDialog(this.pageLevelDialogId);
      this.pageLevelDialogShown = false;
      this.pageLevelDialogId = -1;
      console.info('页面级dialog已关闭');
    }
  }

  closeNonPageLevelDialog(): void {
    if (this.nonPageLevelDialogId !== -1) {
      promptAction.closeCustomDialog(this.nonPageLevelDialogId);
      this.nonPageLevelDialogShown = false;
      this.nonPageLevelDialogId = -1;
      console.info('非页面级dialog已关闭');
    }
  }

  // 模拟router跳转
  simulateRouterJump(): void {
    console.info('模拟router跳转到新页面');
    // 页面级dialog需要手动关闭（不跟随页面）
    if (this.pageLevelDialogShown) {
      this.closePageLevelDialog();
    }
    // 非页面级dialog会自动跟随页面显示
    this.showTestPage = true;
  }

  // 返回原页面
  backToPreviousPage(): void {
    console.info('返回到原页面');
    this.showTestPage = false;
    
    // 恢复页面级dialog
    if (this.pageLevelDialogWasShown) {
      setTimeout(async () => {
        await this.showPageLevelDialog();
      }, 300);
    }
    // 非页面级dialog会自动跟随页面显示
  }

  @Builder
  PageLevelDialogBuilder() {
    Column() {
      Text('页面级Dialog')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('showInSubWindow: false')
        .fontSize(14)
        .margin({ bottom: 15 })

      Text('isModal: false (无蒙层)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 15 })

      Text('跳转后不会显示在新页面')
        .fontSize(16)
        .fontColor(Color.Red)
        .margin({ bottom: 20 })

      Row() {
        Button('确认')
          .width(80)
          .height(40)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('页面级dialog确认按钮被点击');
            this.closePageLevelDialog();
          })

        Button('取消')
          .width(80)
          .height(40)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('页面级dialog取消按钮被点击');
            this.closePageLevelDialog();
          })
      }
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 4 })
    .border({ width: 3, color: Color.Blue })
  }

  @Builder
  NonPageLevelDialogBuilder() {
    Column() {
      Text('非页面级Dialog')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('showInSubWindow: true')
        .fontSize(14)
        .margin({ bottom: 15 })

      Text('跳转后会显示在新页面')
        .fontSize(16)
        .fontColor(Color.Green)
        .margin({ bottom: 20 })

      Text('这个弹窗会跟随页面切换')
        .fontSize(14)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      Row() {
        Button('确认')
          .width(80)
          .height(40)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .margin({ right: 10 })
          .onClick(() => {
            console.info('非页面级dialog确认按钮被点击');
            this.closeNonPageLevelDialog();
          })

        Button('取消')
          .width(80)
          .height(40)
          .backgroundColor(Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            console.info('非页面级dialog取消按钮被点击');
            this.closeNonPageLevelDialog();
          })
      }
    }
    .padding(20)
    .width('38.89%')
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 4 })
    .border({ width: 3, color: Color.Orange })
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

        Text('PopupBox规格页面显示测试2950')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 20 })
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#f0f0f0')
      .padding({ left: 10, right: 10 })

      // 主要内容区域 - 上中下布局
      Column() {
        Text('验证页面级和非页面级dialog跳转行为')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 30, top: 20 })
          .textAlign(TextAlign.Center)

        // 上部：页面级Dialog按钮
        Column() {
          Text('1. 点击页面级Dialog')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button(this.pageLevelDialogShown ? '页面级Dialog已显示 ✓' : '显示页面级Dialog')
            .id('button_page_level_dialog')
            .backgroundColor(this.pageLevelDialogShown ? Color.Green : Color.Blue)
            .fontColor(Color.White)
            .width(250)
            .height(50)
            .fontSize(16)
            .onClick(async () => {
              if (!this.pageLevelDialogShown) {
                await this.showPageLevelDialog();
              }
            })

          if (this.pageLevelDialogShown) {
            Text('✓ 页面级Dialog已显示')
              .fontSize(12)
              .fontColor(Color.Blue)
              .margin({ top: 10 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .margin({ bottom: 60 })

        // 中部：非页面级Dialog按钮
        Column() {
          Text('2. 点击非页面级Dialog')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button(this.nonPageLevelDialogShown ? '非页面级Dialog已显示 ✓' : '显示非页面级Dialog')
            .id('button_non_page_level_dialog')
            .backgroundColor(this.nonPageLevelDialogShown ? Color.Orange : Color.Red)
            .fontColor(Color.White)
            .width(250)
            .height(50)
            .fontSize(16)
            .onClick(async () => {
              if (!this.nonPageLevelDialogShown) {
                await this.showNonPageLevelDialog();
              }
            })

          if (this.nonPageLevelDialogShown) {
            Text('✓ 非页面级Dialog已显示')
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

          Text('预期：页面级dialog消失，非页面级dialog跟随')
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

        Text('2950测试跳转页面')
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

        Text('✓ 页面级dialog在新页面中消失')
          .fontSize(16)
          .fontColor(Color.Green)
          .margin({ bottom: 10 })

        Text('✓ 非页面级dialog跟随显示在新页面')
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

        Text('• 页面级dialog重新显示在原页面')
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 5 })

        Text('• 非页面级dialog继续跟随显示')
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