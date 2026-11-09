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
struct DocComponentSlayOut10 {
  @State customPopup: boolean = false;
  @State handlePopup: boolean = false;
  @State text: string = 'Sets the offset relative to the placement position and the ability to hide arrows';

  build() {
    Column({ space: 100 }) {
      Text()
        .fontSize(18)
        .backgroundColor(0xAFEEEE)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Yellow)
        .fontWeight(FontWeight.Bolder)
        .border({ width: 1, color: 0xEEEEEE })
        .padding(10)
        .margin(10)
        .maxLines(2)

      Button('PopupOptions')
        .onClick(() => {
          this.handlePopup = !this.handlePopup;
        })
        .bindPopup(this.handlePopup, {
          width: 300,
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
          enableArrow: false, // 气泡弹出时不显示箭头
          arrowHeight: 20,
          arrowWidth: 20,
          radius: 20,
          offset:{x:10,y:10},//相对位置偏移
          shadow: ShadowStyle.OUTER_DEFAULT_XS,
          arrowPointPosition: ArrowPointPosition.START,
          backgroundBlurStyle: BlurStyle.NONE,
          popupColor: Color.Red,
          autoCancel: true,
        })
        .id('DocComponentSlayOut10')
    }
    .width('100%')
  }
}