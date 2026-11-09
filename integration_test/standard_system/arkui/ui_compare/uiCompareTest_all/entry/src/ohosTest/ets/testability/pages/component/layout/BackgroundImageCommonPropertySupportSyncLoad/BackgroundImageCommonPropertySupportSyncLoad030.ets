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
struct BackgroundImageCommonPropertySupportSyncLoad030 {
  @State name: string = 'BackgroundImageCommonPropertySupportSyncLoad030';
  @State message: string = this.name;
  @State imgSrc: string | undefined | null = ('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/bigImage.jpg');
  @State imgSrc1: string | undefined | null = undefined;
  @State imgSrc2: string | undefined | null = undefined;
  @State imgSrc3: string | undefined | null = undefined;
  @State imgSrc4: string | undefined | null = undefined;
  @State imgSrc5: string | undefined | null = undefined;
  @State imgType: string = 'JPG';
  @State imgInfo: string = '图片资源类型： ';

  build() {
    Scroll() {
      Column() {
        Text(this.message)
          .margin(10)

        Text(this.imgInfo)
          .margin(10)

        Button('多个backgroundImage加载')
          .id(this.name + '_01')
          .onClick(() => {
            this.imgSrc1 = '/images/1.png';
            this.imgSrc2 = '/images/2.png';
            this.imgSrc3 = '/images/3.png';
            this.imgSrc4 = '/images/4.png';
            this.imgSrc5 = ('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.svg');
            this.imgType = 'PNG and SVG';
            this.imgInfo = `图片资源类型： ${this.imgType}`;
          })
          .backgroundColor(0x317aff)
          .margin({
            top: 5,
            bottom: 5,
            left: 10,
            right: 10
          })

        Column() {
          Text('Column1')
            .fontSize(20)
            .fontColor(Color.Green)
            .textAlign(TextAlign.Center)
            .margin(10)
        }
        .width('41.67%')
        .height('24.59%')
        .backgroundImage(this.imgSrc1, {
          repeat: ImageRepeat.XY,
          syncLoad: true
        })
        .border({
          width: 5,
          color: Color.Green,
          radius: 10,
          style: BorderStyle.Dotted
        })
        .margin({
          top: 15,
          bottom: 5,
          left: 10,
          right: 10
        })

        Column() {
          Text('Column2')
            .fontSize(20)
            .fontColor(Color.Green)
            .textAlign(TextAlign.Center)
            .margin(10)
        }
        .width('41.67%')
        .height('24.59%')
        .backgroundImage(this.imgSrc2, {
          repeat: ImageRepeat.XY,
          syncLoad: true
        })
        .border({
          width: 5,
          color: Color.Green,
          radius: 10,
          style: BorderStyle.Dotted
        })
        .margin({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })

        Column() {
          Text('Column3')
            .fontSize(20)
            .fontColor(Color.Green)
            .textAlign(TextAlign.Center)
            .margin(10)
        }
        .width('41.67%')
        .height('24.59%')
        .backgroundImage(this.imgSrc3, {
          repeat: ImageRepeat.XY,
          syncLoad: true
        })
        .border({
          width: 5,
          color: Color.Green,
          radius: 10,
          style: BorderStyle.Dotted
        })
        .margin({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })

        Column() {
          Text('Column4')
            .fontSize(20)
            .fontColor(Color.Green)
            .textAlign(TextAlign.Center)
            .margin(10)
        }
        .width('41.67%')
        .height('24.59%')
        .backgroundImage(this.imgSrc4, {
          repeat: ImageRepeat.XY,
          syncLoad: true
        })
        .border({
          width: 5,
          color: Color.Green,
          radius: 10,
          style: BorderStyle.Dotted
        })
        .margin({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })

        Column() {
          Text('Column5')
            .fontSize(20)
            .fontColor(Color.Green)
            .textAlign(TextAlign.Center)
            .margin(10)
        }
        .width('41.67%')
        .height('24.59%')
        .backgroundImage(this.imgSrc5, {
          repeat: ImageRepeat.XY,
          syncLoad: true
        })
        .border({
          width: 5,
          color: Color.Green,
          radius: 10,
          style: BorderStyle.Dotted
        })
        .margin({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })
      }
      .margin({
        top: 5,
        bottom: 10,
        left: 8,
        right: 8
      })
    }
    .id(this.name + '_02')

  }
}
