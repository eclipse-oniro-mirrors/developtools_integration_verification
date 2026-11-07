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

  constructor(text: string, dialogController: promptAction.DialogController) {
    this.text = text;
    this.dialogController = dialogController;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .fontStyle(FontStyle.Italic)
      .fontWeight(FontWeight.Bolder)
      .margin({ bottom: 20 })

    Button('通过外部传递的DialogController关闭')
      .id('UiComponentPopupBoxSpecificationsPageDisplay33_03')
      .fontSize(18)
      .width(200)
      .height(50)
      .type(ButtonType.Capsule)
      .onClick(() => {
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
struct UiComponentPopupBoxSpecificationsPageDisplay33 {
  @Local message: string = 'CustomDialog测试';
  private dialogController: promptAction.DialogController = new promptAction.DialogController();

  build() {
    Column({ space: 20 }) {
      Text('openCustomDialogWithController测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('返回首页')
        .id('UiComponentPopupBoxSpecificationsPageDisplay33_01')
        .fontSize(18)
        .type(ButtonType.Capsule)
        .width(200)
        .height(50)
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
        })

      Button('openCustomDialogWithController')
        .id('UiComponentPopupBoxSpecificationsPageDisplay33_02')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
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
        .onClick(() => {
          console.log('打开弹窗成功')
          let uiContext = this.getUIContext();
          let promptAction = uiContext.getPromptAction();
          let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText),
            new Params(this.message, this.dialogController));
          const node: FrameNode | null = uiContext.getFrameNodeById('UiComponentPopupBoxSpecificationsPageDisplay33_02') || null;
          promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
            levelMode: LevelMode.EMBEDDED,
            levelUniqueId: node?.getUniqueId(),
            immersiveMode: ImmersiveMode.EXTEND,
            isModal: false,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
          })
            .then(() => {
              console.info('openCustomDialogWithController succeeded');
            })
            .catch((error: BusinessError) => {
              console.error(`openCustomDialogWithController error code is ${error.code}, message is ${error.message}`);
            })
        })

      Text('预期效果：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('切换界面，弹窗跟随界面消失，重新进入页面(返回跳转)，弹窗仍然存在')
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

      Text('openCustomDialogWithController set LevelMode: EMBEDDED\nlevelUniqueId: 正常值\nImmersiveMode: EXTEND')
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

