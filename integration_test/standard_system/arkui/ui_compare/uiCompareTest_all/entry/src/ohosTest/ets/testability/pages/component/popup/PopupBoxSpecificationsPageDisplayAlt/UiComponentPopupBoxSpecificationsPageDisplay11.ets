/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LevelMode, ImmersiveMode } from '@kit.ArkUI';

@CustomDialog
@Component
struct CustomDialogExample {
  controller?: CustomDialogController;
  uiContext?: UIContext;

  build() {
    Column() {
      Text('CustomDialog测试')
        .fontSize(20)
        .margin({ bottom: 20 })

      Button('router跳转')
        .id('UiComponentPopupBoxSpecificationsPageDisplay11_01')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('跳转成功')
          this.uiContext?.getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
        })
        .margin({ bottom: 10 })

      Button('关闭弹窗')
        .id('UiComponentPopupBoxSpecificationsPageDisplay11_02')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('关闭成功')
          if (this.controller != undefined) {
            this.controller.close();
          }
        })
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }
}

@Entry
@Component
struct UiComponentPopupBoxSpecificationsPageDisplay11 {
  @State offsetY: number = 0;
  dialogController: CustomDialogController | null = null;

  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Column({ space: 20 }) {
      Text('CustomDialogController测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('向下偏移')
        .id('UiComponentPopupBoxSpecificationsPageDisplay11_03')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          this.offsetY += 50;
          console.log('偏移成功，当前偏移: ' + this.offsetY)
        })

      Button('CustomDialogController')
        .id('UiComponentPopupBoxSpecificationsPageDisplay11_04')
        .fontSize(18)
        .width(200)
        .height(50)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 20,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('打开弹窗成功')
          if (this.dialogController != null) {
            this.dialogController.close();
          }
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample({
              uiContext: this.getUIContext()
            }),
            autoCancel: true,
            alignment: DialogAlignment.Center,
            offset: { dx: this.offsetY, dy: this.offsetY },
            customStyle: false,
            cornerRadius: 20,
            width: '80%',
            height: 200,
            backgroundColor: 0xd9ffffff,
            maskRect: { x: this.offsetY, y: this.offsetY, width: '100%', height: '100%' },
            levelMode: 777 as LevelMode,
            immersiveMode: ImmersiveMode.EXTEND,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info(`reason= ${dismissDialogAction.reason}`);
              console.info('dialog onWillDismiss');
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss();
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss();
              }
            }
          });
          this.dialogController.open();
        })

      Text(`当前偏移: ${this.offsetY}px`)
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
