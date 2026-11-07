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
import { ComponentContent, promptAction } from '@kit.ArkUI';

class Params {
  public text: string = '';
  externalController: promptAction.DialogController = new promptAction.DialogController();
  closeCallback: () => void = () => {};

  constructor(text: string, externalController: promptAction.DialogController, closeCallback: () => void) {
    this.text = text;
    this.externalController = externalController; // 外部传递的
    this.closeCallback = closeCallback; // 自定义组件的关闭回调
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 20 })
      .textAlign(TextAlign.Center)

    Button('点我关闭弹窗：通过自定义组件自带的controller')
      .id('UiComponentPopupBoxSpecificationsCustomClose01_01')
      .fontSize(14)
      .margin({ bottom: 10 })
      .onClick(() => {
        console.log('通过自定义组件自带的controller关闭弹窗');
        // 调用自定义组件的关闭回调
        params.closeCallback();
      })

    Button('点我关闭弹窗：通过外部传递的DialogController')
      .fontSize(14)
      .id('UiComponentPopupBoxSpecificationsCustomClose01_02')
      .onClick(() => {
        console.log('通过外部传递的DialogController关闭弹窗');
        // 使用外部传递的controller
        if (params.externalController != undefined) {
          params.externalController.close();
        } else {
          console.log('外部dialogController为空');
        }
      })
  }
  .backgroundColor('#FFF0F0F0')
  .padding(20)
  .borderRadius(12)
  .width('100%')
  .height('100%')
}

@Entry
@ComponentV2
struct UiComponentPopupBoxSpecificationsCustomClose01 {
  @Local message: string = '测试弹窗';
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
  private baseDialogOptions8: promptAction.BaseDialogOptions = {
    alignment: DialogAlignment.CenterStart,
    showInSubWindow: false,
    isModal: true,
    autoCancel: false,
  }

  build() {
    Column({ space: 30 }) {
      Text('openCustomDialogWithController测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({ top: 50 })

      Text('验证枚举值8 (DialogAlignment.CenterStart) 弹窗场景')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .borderRadius(8)
        .width('90%')

      Button('baseDO8')
        .id('UiComponentPopupBoxSpecificationsCustomClose01_03')
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
        .backgroundColor('#2196F3')
        .onClick(() => {
          console.log('点击baseDO8按钮，打开枚举值8的弹窗');
          this.dialogController = new promptAction.DialogController();
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          const closeCallback = () => {
            console.log('执行自定义组件的关闭回调');
            this.dialogController.close();
          };
          let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText),
            new Params(this.message, this.dialogController, closeCallback));
          promptActionInstance.openCustomDialogWithController(contentNode, this.dialogController, this.baseDialogOptions8)
            .then(() => {
              console.info('弹窗打开成功 - 枚举值8 (DialogAlignment.CenterStart)');
            })
            .catch((error: BusinessError) => {
              console.error(`OpenCustomDialogWithController error code: ${error.code}, message: ${error.message}`);
            })
        })

      Text('预期结果：')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('弹窗显示在屏幕左侧中央位置\n 弹窗内容显示正常\n 两个关闭按钮都能正常关闭弹窗')
        .fontSize(14)
        .lineHeight(22)
        .backgroundColor('#E8F5E8')
        .padding(15)
        .borderRadius(8)
        .width('90%')
        .fontColor('#4CAF50')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}