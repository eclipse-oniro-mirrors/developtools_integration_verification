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


@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
  })

  build() {
    Column() {
      Text('CustomDialog测试')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Text('验证EMBEDDED模式下DEFAULT + 异常levelUniqueId的偏移行为')
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('确认')
          .onClick(() => {
            console.info('CustomDialog确认按钮被点击');
            this.controller.close()
          })
          .backgroundColor(0x317aff)
        Button('取消')
          .onClick(() => {
            console.info('CustomDialog取消按钮被点击');
            this.controller.close()
          })
          .backgroundColor(0x317aff)
      }.margin({ bottom: 10 })
    }
    .backgroundColor(Color.White)
    .padding(20)
    .borderRadius(10)
  }
}

@Entry
@Component
struct PopupBoxSpecificationsPageDisplay0580 {
  @State offsetEnabled: boolean = false;
  @State customDialogShown: boolean = false;
  @State autoExecuted: boolean = false;
  
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
    cancel: () => {
      console.info('CustomDialog被取消 - 点击空白区域');
      console.info('空白区域点击功能正常工作');
      this.customDialogShown = false;
    },
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: this.offsetEnabled ? 100 : 0 },
    gridCount: 4,
    customStyle: false,
    backgroundColor: 0xd9ffffff,
    cornerRadius: 20,
    width: '80%',
    height: '40%',
    levelMode: LevelMode.EMBEDDED,
    levelUniqueId: -999, // 异常值
    immersiveMode: ImmersiveMode.DEFAULT,
    showInSubWindow: true, // 支持页面跟随
    isModal: false, // 允许页面交互
    maskRect: { x: 0, y: 0, width: '100%', height: '100%' }
  })

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
      console.info('自动执行: 显示CustomDialog');
      this.showCustomDialog();
    }, 1000);
  }

  showCustomDialog(): void {
    this.dialogController.open();
    this.customDialogShown = true;
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

        Text('PopupBox规格页面显示测试0580')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 20 })
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor('#f0f0f0')
      .padding({ left: 10, right: 10 })

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

        Button(this.offsetEnabled ? '4. 向下偏移已启用 ✓' : '4. 点击向下偏移')
          .id('button_offset_down')
          .backgroundColor(this.offsetEnabled ? Color.Green : Color.Blue)
          .fontColor(Color.White)
          .margin({ top: 10, bottom: 10 })
          .onClick(() => {
            this.offsetEnabled = true;
            this.autoExecuted = true;
          })

        Button('5. 点击CustomDialogController')
          .id('button_custom_dialog')
          .backgroundColor(Color.Orange)
          .fontColor(Color.White)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.autoExecuted = true;
            this.showCustomDialog();
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

        if (this.customDialogShown) {
          Text('CustomDialog已显示')
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
    .backgroundColor('#E3F2FD')
  }
}
