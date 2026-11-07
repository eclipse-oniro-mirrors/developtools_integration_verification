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

import { LevelMode, ImmersiveMode, promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

let customDialogId: number = 0;

@Builder
function customDialogBuilder(uiContext: UIContext) {
  Column() {
    Text('promptAction方式弹窗')
      .fontSize(20)
      .fontStyle(FontStyle.Italic)
      .fontWeight(500)
      .margin({ bottom: 20 })
      .fontColor('#4ECDC4')

    Button('router跳转')
      .id('UiComponentPopupBoxSpecificationsPageDisplay71_01')
      .fontSize(18)
      .width(200)
      .height(50)
      .type(ButtonType.Capsule)
      .onClick(() => {
        console.log('跳转成功')
        uiContext.getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiCom ponentPopupBoxSpecificationsPageDisplayNextPage' });
      })
      .margin({ bottom: 10 })

    Button('关闭弹窗')
      .id('UiComponentPopupBoxSpecificationsPageDisplay71_02')
      .fontSize(18)
      .width(200)
      .height(50)
      .type(ButtonType.Capsule)
      .onClick(() => {
        console.log('关闭成功 - promptAction方式')
        promptAction.closeCustomDialog(customDialogId);
      })
  }
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(12)
}

@Entry
@Component
struct UiComponentPopupBoxSpecificationsPageDisplay71 {
  @State offsetY: number = 0;
  private uiContext: UIContext = this.getUIContext();

  @Builder
  customDialogComponent() {
    customDialogBuilder(this.uiContext)
  }

  build() {
    Column({ space: 20 }) {
      Text('prompt_openCustomDialog测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('向下偏移')
        .id('UiComponentPopupBoxSpecificationsPageDisplay71_03')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          this.offsetY += 50;
          console.log('偏移成功，当前偏移: ' + this.offsetY)
        })

      Button('prompt_openCustomDialog')
        .id('UiComponentPopupBoxSpecificationsPageDisplay71_04')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 12,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onClick(() => {
          console.log('打开弹窗成功')
          const node: FrameNode | null = this.uiContext.getFrameNodeById('UiComponentPopupBoxSpecificationsPageDisplay71_04') || null;
          promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            alignment: DialogAlignment.Center,
            autoCancel: true,
            maskRect: { x: this.offsetY, y: this.offsetY, width: '100%', height: '100%' },
            levelMode: LevelMode.EMBEDDED,
            levelUniqueId: 1.1,
            immersiveMode: -1,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info(`reason= ${dismissDialogAction.reason}`);
              console.info('dialog onWillDismiss');
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss();
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss();
              }
            },
            onDidAppear: () => {
              console.info('openCustomDialog,is onDidAppear!');
            },
            onDidDisappear: () => {
              console.info('openCustomDialog,is onDidDisappear!');
            },
            onWillAppear: () => {
              console.info('openCustomDialog,is onWillAppear!');
            },
            onWillDisappear: () => {
              console.info('openCustomDialog,is onWillDisappear!');
            },
          }).then((dialogId: number) => {
            customDialogId = dialogId;
            console.info('promptAction方式打开成功, dialogId: ' + dialogId);
          }).catch((error: BusinessError) => {
            console.error(`promptAction方式打开失败 code: ${error.code}, message: ${error.message}`);
          })
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

      Text('预期效果：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('promptAction.openCustomDialog_切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出')
        .fontSize(14)
        .lineHeight(22)
        .backgroundColor('#FFF8DC')
        .padding(15)
        .borderRadius(8)
        .width('90%')
        .fontColor('#DAA520')

      Text('配置说明：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 10 })

      Text('prompt_openCustomDialog set LevelMode: EMBEDDED\nlevelUniqueId: 异常值\nImmersiveMode: -1 (异常值)')
        .fontSize(14)
        .lineHeight(22)
        .backgroundColor('#F0F8FF')
        .padding(15)
        .borderRadius(8)
        .width('90%')
        .fontColor('#4169E1')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

