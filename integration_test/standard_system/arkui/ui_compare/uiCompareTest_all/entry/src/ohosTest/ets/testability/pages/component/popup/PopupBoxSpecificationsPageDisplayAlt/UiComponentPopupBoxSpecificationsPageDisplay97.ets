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

import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, LevelMode, ImmersiveMode, promptAction } from '@kit.ArkUI';

class Params {
  public text: string = '';
  dialogController: promptAction.DialogController = new promptAction.DialogController();
  uiContext: UIContext | null = null;

  constructor(text: string, dialogController: promptAction.DialogController, uiContext: UIContext) {
    this.text = text;
    this.dialogController = dialogController;
    this.uiContext = uiContext;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .fontStyle(FontStyle.Italic)
      .fontWeight(500)
      .margin({ bottom: 20 })
      .fontColor('#4ECDC4')

    Button('router跳转')
      .id('UiComponentPopupBoxSpecificationsPageDisplay97_01')
      .fontSize(18)
      .width(200)
      .height(50)
      .type(ButtonType.Capsule)
      .onClick(() => {
        console.log('跳转成功')
        params.uiContext?.getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
      })
      .margin({ bottom: 10 })

    Button('通过外部传递的DialogController关闭')
      .id('UiComponentPopupBoxSpecificationsPageDisplay97_02')
      .fontSize(18)
      .width(200)
      .height(50)
      .type(ButtonType.Capsule)
      .onClick(() => {
        console.log('关闭成功 - DialogController方式')
        if (params.dialogController != undefined) {
          params.dialogController.close();
        }
      })
  }
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(12)
}

@Entry
@ComponentV2
struct UiComponentPopupBoxSpecificationsPageDisplay97 {
  @Local message: string = 'openCustomDialogWithController测试';
  @Local maskX: number|string = 0;
  @Local maskY: number|string = 0;
  private dialogController: promptAction.DialogController = new promptAction.DialogController();

  build() {
    Column({ space: 20 }) {
      Text('uiContext_openCustomDialogWithController测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('100%mask')
        .id('UiComponentPopupBoxSpecificationsPageDisplay97_03')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          this.maskX = '100%'
          this.maskY = '100%'
          console.log('100%mask设置成功')
        })

      Button('uiContext_openCustomDialogWithController')
        .id('UiComponentPopupBoxSpecificationsPageDisplay97_04')
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
          let uiContext = this.getUIContext();
          let promptAction = uiContext.getPromptAction();
          let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText),
            new Params(this.message, this.dialogController, uiContext));
          const node: FrameNode | null = uiContext.getFrameNodeById('UiComponentPopupBoxSpecificationsPageDisplay97_04') || null;
          promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
            levelMode: LevelMode.EMBEDDED,
            levelUniqueId: node?.getUniqueId(),
            immersiveMode: ImmersiveMode.DEFAULT,
            isModal: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: 0 },
            maskRect: { x: 0, y: 0, width: this.maskX, height: this.maskY },
            onDidAppear: () => {
              console.info('openCustomDialogWithController,is onDidAppear!');
            },
            onDidDisappear: () => {
              console.info('openCustomDialogWithController,is onDidDisappear!');
            },
            onWillAppear: () => {
              console.info('openCustomDialogWithController,is onWillAppear!');
            },
            onWillDisappear: () => {
              console.info('openCustomDialogWithController,is onWillDisappear!');
            },
          })
            .then(() => {
              console.info('openCustomDialogWithController succeeded');
            })
            .catch((error: BusinessError) => {
              console.error(`openCustomDialogWithController error code is ${error.code}, message is ${error.message}`);
            })
        })

      Text(`当前mask: width=${this.maskX}, height=${this.maskY}`)
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

      Text('uiContext_openCustomDialogWithController_弹窗不跟随，只在当前页面层显示，左滑或者点击空白，弹窗退出')
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

      Text('uiContext_openCustomDialogWithController set LevelMode: EMBEDDED\nlevelUniqueId: 正常值\nImmersiveMode: DEFAULT')
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

