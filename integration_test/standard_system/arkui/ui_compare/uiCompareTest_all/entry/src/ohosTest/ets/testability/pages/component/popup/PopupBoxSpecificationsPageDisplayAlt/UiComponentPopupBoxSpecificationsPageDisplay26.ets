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

import { promptAction, LevelMode, ImmersiveMode, PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@ComponentV2
struct UiComponentPopupBoxSpecificationsPageDisplay26 {
  @Local message: string = 'CustomDialog测试';
  private uiContext: UIContext = this.getUIContext();
  private promptActionInstance: PromptAction = this.uiContext.getPromptAction();
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
  private customDialogComponentId: number = 0;

  @Builder
  customDialogComponent() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .margin({ bottom: 20 })

      Button('通过DialogId关闭')
        .id('UiComponentPopupBoxSpecificationsPageDisplay26_03')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('通过DialogId关闭')
          this.promptActionInstance.closeCustomDialog(this.customDialogComponentId);
        })
        .margin({ bottom: 10 })

      Button('通过DialogController关闭')
        .id('UiComponentPopupBoxSpecificationsPageDisplay26_04')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('通过DialogController关闭')
          this.dialogController.close();
        })
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  build() {
    Column({ space: 20 }) {
      Text('presentCustomDialog测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('返回首页')
        .id('UiComponentPopupBoxSpecificationsPageDisplay26_01')
        .fontSize(18)
        .type(ButtonType.Capsule)
        .width(200)
        .height(50)
        .onClick(() => {
          this.uiContext.getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
        })

      Button('presentCustomDialog')
        .id('UiComponentPopupBoxSpecificationsPageDisplay26_02')
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
          this.promptActionInstance.presentCustomDialog(() => {
            this.customDialogComponent()
          }, this.dialogController, {
            levelMode: LevelMode.EMBEDDED,
            levelUniqueId: -999,
            immersiveMode: ImmersiveMode.EXTEND,
            isModal: false,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            backgroundColor: 0xd9ffffff,
            cornerRadius: 20,
            width: '80%',
            height: 250,
          }).then((dialogId: number) => {
            this.customDialogComponentId = dialogId;
            console.log('presentCustomDialog成功，dialogId: ' + dialogId);
          }).catch((error: BusinessError) => {
            console.error(`presentCustomDialog error: ${error.code}, ${error.message}`);
          })
        })

      Text('预期效果：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('dialog节点为全局窗口顶层')
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

      Text('LevelMode: EMBEDDED\nlevelUniqueId: 异常值(-999)\nImmersiveMode: EXTEND')
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

