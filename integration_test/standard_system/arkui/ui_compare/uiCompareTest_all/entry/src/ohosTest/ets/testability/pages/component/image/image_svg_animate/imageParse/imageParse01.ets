/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { uiAppearance } from '@kit.ArkUI';

@Entry
@Component
struct ImageParse01 {
  @State info: string = 'loading~~';

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Text('svg with fillColor')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Text(this.info)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width(200)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Button('setDarkMode ALWAYS_DARK')
          .id('imageParse01_01')
          .height(40)
          .fontSize(14)
          .fontColor(Color.Black)
          .width('75%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (error) => {
                if (error) {
                  console.error('Set dark-mode failed, ' + error.message);
                } else {
                  console.info('Set dark-mode successfully.');
                }
              })
            } catch (error) {
              console.error('Set dark-mode failed, ' + error.message);
            }
          })

        Button('setDarkMode ALWAYS_LIGHT')
          .id('imageParse01_02')
          .height(40)
          .fontSize(14)
          .fontColor(Color.Black)
          .width('75%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, (error) => {
                if (error) {
                  console.error('Set dark-mode failed, ' + error.message);
                } else {
                  console.info('Set dark-mode successfully.');
                }
              })
            } catch (error) {
              console.error('Set dark-mode failed, ' + error.message);
            }
          })

        Image($r('app.media.imageLabel01'))
          .width(110)
          .height(110)
          .margin(20)
          .padding(5)
          .fillColor(Color.Brown)
          .backgroundColor(Color.White)
          .onComplete((event) => {
            if (event) {
              this.info = 'loading success'
            }
          })
      }
    }.height('100%')
    .width('100%')
    .padding({ right: 10, top: 10 })
  }
}
