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

import { PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentPopupBoxSpecifications02 {
  @State handlePopup: boolean = false;
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();

  build() {
    Column() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_0500')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#007DFF')
          .letterSpacing(0.5)
          .textAlign(TextAlign.Center)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text('Level 3 测试用例')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#99182431')
          .letterSpacing(0.3)
          .textAlign(TextAlign.Center)
          .margin({ top: 3 })
          .opacity(0.8)
      }
      .width('100%')
      .padding({ top: 8, bottom: 8, left: 12, right: 12 })
      .backgroundColor('#E6F2FD')
      .borderRadius(6)
      .margin({ top: 6, bottom: 4 })
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .shadow({
        radius: 2,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 1
      })

      Column({ space: 6 }) {
        Text('测试配置')
          .fontSize(13)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Medium)
          .fontColor('#E65100')
          .letterSpacing(0.5)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 2 })

        Text('组件: Button + Popup弹窗 + 警告弹窗')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.2)
          .lineHeight(16)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('功能: popup与警告弹窗同时出现')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#E84026')
          .fontWeight(FontWeight.Medium)
          .letterSpacing(0.2)
          .lineHeight(16)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('退出方式: 可以逐层退出')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.2)
          .lineHeight(16)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('测试类型: 功能测试')
          .fontSize(11)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.2)
          .lineHeight(16)
          .alignSelf(ItemAlign.Start)
          .opacity(0.85)
      }
      .width('90%')
      .padding({ top: 10, bottom: 10, left: 12, right: 12 })
      .backgroundColor('#FFF5F0')
      .borderRadius(6)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 6, bottom: 4 })
      .border({
        width: 1,
        color: '#FFE0B2',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 3,
        color: '#0D000000',
        offsetX: 0,
        offsetY: 2
      })

      Column({ space: 6 }) {
        Text('预期效果')
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2E7D32')
          .letterSpacing(0.5)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 3 })

        Text('✓ Button组件可以正常显示')
          .fontSize(11)
          .fontColor('#388E3C')
          .letterSpacing(0.2)
          .lineHeight(18)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 点击Button后Popup和警告弹窗同时出现')
          .fontSize(11)
          .fontColor('#388E3C')
          .letterSpacing(0.2)
          .lineHeight(18)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ Popup和警告弹窗可以同时显示')
          .fontSize(11)
          .fontColor('#388E3C')
          .letterSpacing(0.2)
          .lineHeight(18)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 可以逐层退出（先关闭Popup或警告弹窗）')
          .fontSize(11)
          .fontColor('#388E3C')
          .letterSpacing(0.2)
          .lineHeight(18)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 警告弹窗支持autoCancel自动关闭')
          .fontSize(11)
          .fontColor('#388E3C')
          .letterSpacing(0.2)
          .lineHeight(18)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 两个弹窗互不干扰，独立控制')
          .fontSize(11)
          .fontColor('#388E3C')
          .letterSpacing(0.2)
          .lineHeight(18)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)
      }
      .width('90%')
      .padding({ top: 10, bottom: 10, left: 12, right: 12 })
      .backgroundColor('#E8F5E9')
      .borderRadius(6)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 12, bottom: 8 })
      .border({
        width: 1,
        color: '#C8E6C9',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 3,
        color: '#0D000000',
        offsetX: 0,
        offsetY: 2
      })

      Divider()
        .strokeWidth(1)
        .color('#0A182431')
        .margin({ top: 4, bottom: 4 })
        .vertical(false)
        .lineCap(LineCapStyle.Round)

      Column({ space: 5 }) {
        Button('点击显示Popup和警告弹窗')
          .fontSize(16)
          .fontColor(Color.White)
          .backgroundColor('#007DFF')
          .width(280)
          .height(50)
          .id('UIComponentPopupBoxSpecifications02_02')
          .borderRadius(8)
          .type(ButtonType.Normal)
          .stateEffect(true)
          .enabled(true)
          .fontWeight(FontWeight.Medium)
          .shadow({
            radius: 4,
            color: '#33007DFF',
            offsetX: 0,
            offsetY: 2
          })
          .border({
            width: 0.5,
            color: '#0051D5',
            style: BorderStyle.Solid
          })
          .onClick(() => {
            // 显示Popup弹窗
            this.handlePopup = true;
            console.info('Popup弹窗已显示');
            // 显示警告弹窗，与Popup同时显示
            this.promptAction.showDialog({
              title: '警告',
              message: '这是警告弹窗，与Popup同时显示。两个弹窗可以独立操作，支持逐层退出。',
              buttons: [
                {
                  text: '确定',
                  color: '#007DFF'
                }
              ],
              alignment: DialogAlignment.Bottom
            })
          })
          .bindPopup(this.handlePopup, {
            message: '这是Popup弹窗，与警告弹窗同时显示',
            messageOptions: {
              textColor: Color.Black,
            },
            placement: Placement.Bottom,
            enableArrow: true,
            arrowHeight: 20,
            arrowWidth: 20,
            radius: 10,
            offset: { x: 0, y: 5 },
            popupColor: Color.White,
            shadow: {
              radius: 8,
              color: '#1A000000',
              offsetX: 0,
              offsetY: 4
            },
            autoCancel: true,
            showInSubWindow: false,
            targetSpace: 8,
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(
      {
        left: 8,
        right: 8,
        top: 4,
        bottom: 4
      })
    .backgroundColor('#F5F5F5')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
  }
}

