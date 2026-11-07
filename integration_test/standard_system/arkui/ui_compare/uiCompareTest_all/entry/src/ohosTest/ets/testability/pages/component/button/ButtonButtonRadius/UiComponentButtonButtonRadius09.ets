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

import { i18n } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentButtonButtonRadius09 {
  private selectedDate: Date = new Date();
  private selectTime: Date = new Date('2025-8-25T08:30:00')
  @State text : string = 'PopupOptions set all button type to default'
  @State handlePopup: boolean = false;

  build() {
    Column() {
      Text(this.text)
        .width('80%')
        .height('20%')
        .padding(3)
        .ellipsisMode(EllipsisMode.END)
        .fontSize(5)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .lineHeight(20)
        .fontWeight(FontWeight.Bolder)
        .textAlign(TextAlign.Center)
        .decoration({
          type: TextDecorationType.Underline,
          color:Color.Black
        })
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
        .borderWidth(1)

      Button('PopupOptions')
        .id('UiComponentButtonButtonRadius09_01')
        .labelStyle({
          overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 20,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: 900,
            family: 'cursive',
            style: FontStyle.Italic,
          }
        })
        .onClick(() => {
          this.handlePopup = true;
        })
        .bindPopup(this.handlePopup, {
          message: 'This is a popup with PopupOptions',
          messageOptions: {
            textColor: Color.Red,
            font: {
              size: '14vp',
              style: FontStyle.Italic,
              weight: FontWeight.Bolder
            }
          },
          placement: Placement.Bottom,
          enableArrow: false,
          targetSpace: '15vp',
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.handlePopup = false;
            }
          },
          onWillDismiss: (
            (dismissPopupAction: DismissPopupAction) => {
              console.info('dismissReason:' + JSON.stringify(dismissPopupAction.reason));
              if (dismissPopupAction.reason === DismissReason.PRESS_BACK) {
                dismissPopupAction.dismiss();
              }
            }
          )
        })
    }
    .width('100%')
  }
}