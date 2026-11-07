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
struct ImageReset18 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State info3:string = 'loading~~';
  @State info4:string = 'loading~~';
  @State testArg1:ImageRepeat = ImageRepeat.X;
  @State testArg2:ImageRepeat = ImageRepeat.Y;
  @State testArg3:ImageRepeat = ImageRepeat.XY;
  @State testArg4:ImageRepeat = ImageRepeat.NoRepeat;
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = [$r('app.media.icon'), ImageContent.EMPTY];

  build() {
    Column() {
      Text('image test objectRepeat')
        .height(40)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width(200)
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(10)

      Text('objectRepeat: ' + this.testArg1)
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
        .objectRepeat(this.testArg1)

      Text('objectRepeat: ' + this.testArg2)
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
        .objectRepeat(this.testArg2)

      Text('objectRepeat: ' + this.testArg3)
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
        .objectRepeat(this.testArg3)

      Text('objectRepeat: ' + this.testArg4)
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
        .objectRepeat(this.testArg4)

      Button('Empty')
        .id('ImageReset18')
        .height(40)
        .fontSize(18)
        .fontColor(Color.Black)
        .width(100)
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick(() => {
          this.imageSrcIndex = 1
        })
    }
    .height('100%')
    .width('100%')
  }
}
