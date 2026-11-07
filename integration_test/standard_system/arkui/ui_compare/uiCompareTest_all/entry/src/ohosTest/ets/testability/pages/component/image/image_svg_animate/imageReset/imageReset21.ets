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

@Entry
@Component
struct ImageReset21 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State info3:string = 'loading~~';
  @State info4:string = 'loading~~';
  @State testArg1:ImageInterpolation = ImageInterpolation.None;
  @State testArg2:ImageInterpolation = ImageInterpolation.High;
  @State testArg3:ImageInterpolation = ImageInterpolation.Medium;
  @State testArg4:ImageInterpolation = ImageInterpolation.Low;
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = [$r('app.media.icon'), ImageContent.EMPTY];

  build() {
    Column() {
      Text('image test interpolation')
        .height(40)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width(200)
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(10)

      Text('interpolation: ' + this.testArg1)
        .height(30)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width(150)
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin({top:20, bottom:10})

      Image(this.imageSrcList[this.imageSrcIndex])
        .height(70)
        .width(70)
        .objectFit(ImageFit.Contain)
        .borderWidth(1)
        .interpolation(this.testArg1)

      Text('interpolation: ' + this.testArg2)
        .height(30)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width(150)
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin({top:20, bottom:10})

      Image(this.imageSrcList[this.imageSrcIndex])
        .height(160)
        .width(60)
        .objectFit(ImageFit.Contain)
        .borderWidth(1)
        .interpolation(this.testArg2)

      Text('interpolation: ' + this.testArg3)
        .height(30)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width(150)
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin({top:20, bottom:10})

      Image(this.imageSrcList[this.imageSrcIndex])
        .height(60)
        .width(160)
        .objectFit(ImageFit.Contain)
        .borderWidth(1)
        .interpolation(this.testArg3)

      Text('interpolation: ' + this.testArg4)
        .height(30)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width(150)
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin({top:20, bottom:10})

      Image(this.imageSrcList[this.imageSrcIndex])
        .height(60)
        .width(160)
        .objectFit(ImageFit.Contain)
        .borderWidth(1)
        .interpolation(this.testArg4)

      Row(){
        Button('Empty')
          .id('imageReset21_01')
          .height(40)
          .fontSize(18)
          .fontColor(Color.Black)
          .width(100)
          .border({ width: 1 })
          .fontWeight(300)
          .margin({right:30})
          .onClick(() => {
            this.imageSrcIndex = 1
          })

        Button('传入图片')
          .id('imageReset21_02')
          .height(40)
          .fontSize(18)
          .fontColor(Color.Black)
          .width(130)
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.imageSrcIndex = 1
          })
      }
    }
    .height('100%')
    .width('100%')
  }
}
