/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { ComponentContent, PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class DialogParams {
  public message: string = '';
  promptAction: PromptAction | null = null;
  contentNode: ComponentContent<Object> | null = null;

  constructor(message: string, promptAction: PromptAction | null, contentNode: ComponentContent<Object> | null) {
    this.message = message;
    this.promptAction = promptAction;
    this.contentNode = contentNode;
  }
}

@Builder
function buildCustomDialog(params: DialogParams) {
  Column() {
    Text('自定义弹窗')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Black)
      .margin({ top: 12, bottom: 8 })

    Text(params.message)
      .fontSize(16)
      .fontColor(Color.Black)
      .margin({ bottom: 12 })

    Button('关闭自定义弹窗')
      .fontSize(14)
      .fontColor(Color.White)
      .backgroundColor('#FF6B6B')
      .width(180)
      .height(40)
      .id('UIComponentPopupBoxSpecifications01_01')
      .margin({ bottom: 12 })
      .onClick(() => {
        if (params.promptAction && params.contentNode) {
          params.promptAction.closeCustomDialog(params.contentNode)
            .then(() => {
              console.info('自定义弹窗已关闭');
            })
            .catch((err: BusinessError) => {
              console.error('关闭自定义弹窗失败: ' + JSON.stringify(err));
            });
        }
      })
  }
  .width('100%')
  .height('100%')
  .backgroundColor(Color.White)
  .borderRadius(10)
  .padding(8)
  .shadow({
    radius: 10,
    color: '#33000000',
    offsetX: 0,
    offsetY: 5
  })
}

@Entry
@Component
struct UIComponentPopupBoxSpecifications01 {
  @State handlePopup: boolean = false;
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private contentNode: ComponentContent<Object> | null = null;

  aboutToDisappear() {
    if (this.contentNode !== null) {
      this.contentNode.dispose();
    }
  }

  build() {
    Column() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0490')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#007DFF')
        Text('Level 3 测试用例')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#99182431')
          .margin({ top: 3 })
      }
      .width('100%')
      .padding(6)
      .backgroundColor('#E6F2FD')
      .borderRadius(6)
      .margin({ top: 6 })

      Column({ space: 5 }) {
        Text('测试配置')
          .fontSize(13)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)

        Text('组件: Button + Popup弹窗 + 自定义弹窗')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .alignSelf(ItemAlign.Start)

        Text('功能: popup与其他弹窗同时出现')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#E84026')
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)

        Text('退出方式: 可以逐层退出')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .alignSelf(ItemAlign.Start)
      }
      .width('90%')
      .padding(6)
      .backgroundColor('#FFF5F0')
      .borderRadius(6)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 6 })


      Column({ space: 5 }) {
        Text('预期效果')
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2E7D32')
          .alignSelf(ItemAlign.Start)

        Text('✓ Button组件可以正常显示')
          .fontSize(11)
          .fontColor('#388E3C')
          .alignSelf(ItemAlign.Start)

        Text('✓ 点击Button后Popup和自定义弹窗同时出现')
          .fontSize(11)
          .fontColor('#388E3C')
          .alignSelf(ItemAlign.Start)

        Text('✓ Popup和自定义弹窗可以同时显示')
          .fontSize(11)
          .fontColor('#388E3C')
          .alignSelf(ItemAlign.Start)

        Text('✓ 可以逐层退出（先关闭Popup或自定义弹窗）')
          .fontSize(11)
          .fontColor('#388E3C')
          .alignSelf(ItemAlign.Start)

        Text('✓ 点击自定义弹窗的关闭按钮可以关闭自定义弹窗')
          .fontSize(11)
          .fontColor('#388E3C')
          .alignSelf(ItemAlign.Start)
      }
      .width('90%')
      .padding(6)
      .backgroundColor('#E8F5E9')
      .borderRadius(6)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 12, bottom: 8 })

      Divider()
        .strokeWidth(1)
        .color('#0A182431')
        .margin({ top: 4, bottom: 4 })

      Column({ space: 5 }) {
        Button('点击显示Popup和自定义弹窗')
          .fontSize(16)
          .fontColor(Color.White)
          .backgroundColor('#007DFF')
          .width(280)
          .height(50)
          .id('UIComponentPopupBoxSpecifications01_02')
          .borderRadius(8)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(() => {
            // 显示Popup
            this.handlePopup = true;
            // 显示自定义弹窗
            let dialogParams = new DialogParams(
              '这是自定义弹窗内容，与Popup同时显示',
              this.promptAction,
              null
            );
            this.contentNode = new ComponentContent(
              this.uiContext,
              wrapBuilder(buildCustomDialog),
              dialogParams
            );
            dialogParams.contentNode = this.contentNode;

            this.promptAction.openCustomDialog(this.contentNode)
              .then(() => {
                console.info('自定义弹窗已打开');
              })
              .catch((err: BusinessError) => {
                console.error('打开自定义弹窗失败: ' + JSON.stringify(err));
              });
          })
          .bindPopup(this.handlePopup, {
            message: '这是Popup弹窗，与自定义弹窗同时显示',
            messageOptions: {
              textColor: Color.Black,
            },
            placement: Placement.Bottom,
            enableArrow: true,
            arrowHeight: 20,
            arrowWidth: 20,
            radius: 10,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.handlePopup = false;
                console.info('Popup已关闭');
              }
            }
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 6, right: 6 })
    .backgroundColor('#F5F5F5')
  }
}
