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

@Entry
@Component
struct UiComponentPopupBoxPopupRadiusSeparatedLayer07 {
  @State handlePopup: boolean = false
  @State customPopup: boolean = false
  @State widthShortSize: number = 205;

  @Builder popupBuilder() {
    Row() {
      Text('this is Custom Popup Message')
        .padding(3)
        .fontSize(10)
        .maxLines(3)
        .lineHeight(20)
        .fontWeight(FontWeight.Bolder)
    }
    .height('100%')
    .padding(5)
  }

  build() {
    Column({space: 100}) {
      Button('PopupOptions')
        .onClick(() => {
          this.handlePopup = !this.handlePopup
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
            console.info(JSON.stringify(e.isVisible))
            if (!e.isVisible) {
              this.handlePopup = false
            }
          }
        })

      Text('Popup settings: custom bubble, radius (999)')
        .width('100%')
        .height('20%')
        .padding(3)
        .fontSize(20)
        .maxLines(3)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .lineHeight(20)
        .fontWeight(FontWeight.Bolder)
        .textAlign(TextAlign.Center)
        .margin({
          top:1,
          bottom:20,
          left:1,
          right:1
        })

      Button('CustomPopupOptions')
        .type(ButtonType.Capsule)
        .width(this.widthShortSize)
        .height(100)
        .backgroundColor(0x317aff)
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
          this.customPopup = !this.customPopup
        })
        .id('UiComponentPopupBoxPopupRadiusSeparatedLayer07')
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          radius:999,
          targetSpace: '15vp',
          enableArrow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        })
    }
    .margin(20)
  }
}