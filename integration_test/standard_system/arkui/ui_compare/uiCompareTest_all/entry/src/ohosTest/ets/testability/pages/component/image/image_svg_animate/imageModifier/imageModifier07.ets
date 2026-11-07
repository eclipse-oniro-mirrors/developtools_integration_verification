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
import { CommonModifier } from '@kit.ArkUI';

class CustomModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct ImageModifier07 {
  @State imageModifier: CommonModifier = new CustomModifier()
    .height(450)
    .width(300)
    .linearGradient({
      angle: 90,
      colors: [[0xff0000, 0.0], [0x0000ff, 0.3], [0xffff00, 1.0]],
      direction: GradientDirection.Left,
      repeating: false
    })
    .linearGradientBlur(60, { fractionStops: [[0, 0], [0, 0.66], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
    .foregroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
  @State info1:string = 'rgb image loading~~';
  @State info2:string = 'rgba image loading~~';
  @State img:ResourceStr = $r('app.media.imageLabel07');

  build() {
    Column({ space: 5 }) {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        // svg image
        Text('image Modifier with svg')
          .height(80)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        // info
        Text(this.info1)
          .height(80)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Text(this.info2)
          .height(80)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)


        Image(this.img)
          .attributeModifier(this.imageModifier as CommonModifier)
          .fitOriginalSize(false)
          .fillColor('rgb(255, 255, 255)')
          .onComplete(() => {
            this.info1 = 'rgb image load onComplete';
          })

        Image(this.img)
          .attributeModifier(this.imageModifier as CommonModifier)
          .fitOriginalSize(false)
          .fillColor('rgba(255, 255, 255, 1.0)')
          .onComplete((event) => {
            if (event) {
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.info2 = 'rgba image load onComplete';
            }
          })
      }
      .margin({ top: 20 })
    }
    .height('100%')
    .width('90%')
  }
}