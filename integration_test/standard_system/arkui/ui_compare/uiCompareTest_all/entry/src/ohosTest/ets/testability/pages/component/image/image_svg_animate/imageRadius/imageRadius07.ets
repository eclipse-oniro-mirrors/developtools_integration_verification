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
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ImageRadius07 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State info3:string = 'loading~~';

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text(this.info1)
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width(170)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Text(this.info2)
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width(170)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Text(this.info3)
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width(170)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Image($r('app.media.imageLabel07'))
          .margin(15)
          .width(150)
          .height(150)
          .onComplete((event) => {
            if (event) {
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.info1 = 'loading success'
            }
          })

        Image($r('app.media.imageLabel07'))
          .margin(15)
          .width(150)
          .height(150)
          .onComplete((event) => {
            if (event) {
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.info2 = 'loading success'
            }
          })

        Image($r('app.media.imageLabel07'))
          .margin(15)
          .width(150)
          .height(150)
          .onComplete((event) => {
            if (event) {
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.info3 = 'loading success'
            }
          })

        Button('setDarkMode ALWAYS_DARK')
          .id('imageRadius07_01')
          .margin({ top: 20, bottom: 20 })
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
              let message = (error as BusinessError).message;
              console.error('Set dark-mode failed, ' + message);
            }
          })
        Button('setDarkMode ALWAYS_LIGHT')
          .id('imageRadius07_02')
          .margin({ top: 20, bottom: 20 })
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
              let message = (error as BusinessError).message;
              console.error('Set dark-mode failed, ' + message);
            }
          })
      }
    }
    .height('100%')
    .width('90%')
  }
}
