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
struct ImageModifier03 {
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
  @State info:string = 'loading~~';
  @State img:ResourceStr = ('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png');
  imgUrl:ResourceStr[] = [
    ('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'),
    ('https://' + 'images.openharmony.cn' + '/活动/技术大会20240923/补充头像/默认男头像.svg'),
    ('https://' + 'www.runoob.com' + '/try/demo_source/smiley-2.gif'),
    ('http://' + 'images.openharmony.cn' + '/活动/开发者大会20250428/大会顶端banner图.jpg')
  ]
  index:number = 0;

  build() {
    Column({ space: 5 }) {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        // svg image
        Text('image Modifier with http url')
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
        Text(this.info)
          .height(80)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Button('change image url')
          .id('ImageModifier03')
          .height(80)
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick( () => {
            if(this.index === 3){
              this.index = -1;
            }
            this.index++;
            this.img = this.imgUrl[this.index];
          })

        Image(this.img)
          .attributeModifier(this.imageModifier as CommonModifier)
          .fitOriginalSize(true)
          .onComplete((event) => {
            if (event) {
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.info = 'image load onComplete';
            }
          })
      }
      .margin({ top: 20 })
    }
    .height('100%')
    .width('90%')
  }
}