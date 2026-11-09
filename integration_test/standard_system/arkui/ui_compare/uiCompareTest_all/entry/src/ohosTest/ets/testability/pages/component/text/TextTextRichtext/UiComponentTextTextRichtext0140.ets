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
struct UiComponentTextTextRichtext0140 {
  @State imageWidth: number = 48;
  @State imageHeight: number = 48;
  @State imageFit: ImageFit = ImageFit.Fill;

  build() {
    Column() {
      // 页面描述
      Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0140')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
      Text('测试名称：图片的缩放(ImageSpan宽/高等于图片宽/高)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('图片缩放测试（ImageSpan宽/高等于图片宽/高）：') {
        Span('测试文本')
        ImageSpan($r('sys.media.ohos_app_icon'))
          .width(this.imageWidth)
          .height(this.imageHeight)
          .objectFit(this.imageFit)
        Span('后续文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_image_scale_equal_0140')

      Button('设置宽高为48（等于图片大小）')
        .onClick(() => {
          this.imageWidth = 48;
          this.imageHeight = 48;
        })
        .margin(5)
        .id('button_size_equal_0140')

      Row() {
        Button('默认')
          .onClick(() => {
            this.imageFit = ImageFit.Fill;
          })
          .margin(5)
          .id('button_fit_default_0140')

        Button('Contain')
          .onClick(() => {
            this.imageFit = ImageFit.Contain;
          })
          .margin(5)
          .id('button_fit_contain_0140')

        Button('Cover')
          .onClick(() => {
            this.imageFit = ImageFit.Cover;
          })
          .margin(5)
          .id('button_fit_cover_0140')
      }

      Row() {
        Button('Auto')
          .onClick(() => {
            this.imageFit = ImageFit.Auto;
          })
          .margin(5)
          .id('button_fit_auto_0140')

        Button('Fill')
          .onClick(() => {
            this.imageFit = ImageFit.Fill;
          })
          .margin(5)
          .id('button_fit_fill_0140')

        Button('ScaleDown')
          .onClick(() => {
            this.imageFit = ImageFit.ScaleDown;
          })
          .margin(5)
          .id('button_fit_scaledown_0140')
      }

      Row() {
        Button('None')
          .onClick(() => {
            this.imageFit = ImageFit.None;
          })
          .margin(5)
          .id('button_fit_none_0140')
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

