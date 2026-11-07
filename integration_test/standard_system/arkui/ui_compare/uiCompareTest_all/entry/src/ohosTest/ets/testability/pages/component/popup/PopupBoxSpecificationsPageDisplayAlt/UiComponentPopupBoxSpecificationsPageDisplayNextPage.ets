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
struct Next {
  @State message: string = 'Back';

  build() {
    Row() {
      Column() {
        Text('Next Page')
          .fontSize(30)
          .margin({ bottom: 50 })
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bolder)
          .fontColor('#666666')
          .textAlign(TextAlign.Center)
          .backgroundColor('#F5F5F5')
          .padding(10)
          .width('90%')

        Button(this.message)
          .id('UiComponentPopupBoxSpecificationsPageDisplay_NextPage')
          .fontSize(18)
          .fontWeight(500)
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
          .onClick(() => {
            this.getUIContext().getRouter().back();
            console.log('back successful')
          })
      }
      .width('100%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
