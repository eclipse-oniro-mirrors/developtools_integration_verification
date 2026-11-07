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
      
      Text('验证EMBEDDED模式下异常ImmersiveMode + 异常levelUniqueId的行为')
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
struct PopupBoxSpecificationsPageDisplay0720 {
  @State maskEnabled: boolean = false;
  @State showGlobalMask: boolean = false;
  @State autoExecuted: boolean = false;
  
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
    cancel: () => {
      console.info('CustomDialog被取消');
    },
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: 0 },
    gridCount: 4,
    customStyle: false,
    backgroundColor: 0xd9ffffff,
    cornerRadius: 20,
    width: '80%',
    height: '40%',
    levelMode: LevelMode.EMBEDDED,
    levelUniqueId: -999, // 异常值
    immersiveMode: -999 as ImmersiveMode, // 异常值
    showInSubWindow: false,
    isModal: true,
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
    console.info('自动执行: 100%遮罩已启用');
    this.maskEnabled = true;
    this.showGlobalMask = true;
    setTimeout(() => {
      console.info('自动执行: 显示CustomDialog');
      this.showCustomDialog();
    }, 1000);
  }

  showCustomDialog(): void {
    this.dialogController.open();
  }

  build(): void {
    Stack() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text('PopupBox规格页面显示测试0720')
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

        Text('2. 设置LevelMode:EMBEDDED (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Text('3. 设置ImmersiveMode设置为异常值，设置levelUniqueId为异常值 (已内置)')
          .fontSize(14)
          .margin({ bottom: 5 })

        Button(this.maskEnabled ? '4. 100%遮罩已启用 ✓' : '4. 点击100%mask')
          .id('button_100_mask')
          .backgroundColor(this.maskEnabled ? Color.Green : Color.Blue)
          .fontColor(Color.White)
          .margin({ top: 10, bottom: 10 })
          .onClick(() => {
            this.maskEnabled = true;
            this.showGlobalMask = true;
            this.autoExecuted = true;
          })

        Button('5. 点击CustomDialogController')
          .id('button_custom_dialog')
          .enabled(this.maskEnabled)
          .backgroundColor(this.maskEnabled ? Color.Orange : Color.Gray)
          .fontColor(Color.White)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.autoExecuted = true;
            this.showCustomDialog();
          })

        Text('预期结果：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Text('dialog节点为全局窗口顶层，遮罩整个窗口')
          .fontSize(14)
          .fontColor(Color.Red)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height('100%')

      if (this.showGlobalMask) {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Text('全局遮罩层')
            .fontSize(24)
            .fontColor(Color.White)
            .margin({ bottom: 20 })

          Button('关闭遮罩')
            .id('button_close_mask')
            .backgroundColor(Color.Red)
            .fontColor(Color.White)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showGlobalMask = false;
            })

          Button('在遮罩上显示CustomDialog')
            .id('button_show_customdialog_on_mask')
            .backgroundColor(Color.Orange)
            .fontColor(Color.White)
            .onClick(() => {
              this.showCustomDialog();
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
      }
    }
    .width('100%')
    .height('100%')
  }
}
