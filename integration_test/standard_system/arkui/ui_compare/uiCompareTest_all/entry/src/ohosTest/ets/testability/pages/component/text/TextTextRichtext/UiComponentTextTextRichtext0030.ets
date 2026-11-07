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
struct UiComponentTextTextRichtext0030 {
  build() {
    Scroll() {
      Column() {
        // 页面描述
        Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0030')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        Text('测试名称：Text的子组件类型图片与文本混合(单行)时的水平对齐')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        // 图片位于行首，水平对齐方式未设定
        Text() {
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('图片位于行首文本')
        }
        .width(300)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_start_default_0030')

        // 图片位于行首，水平对齐方式Center
        Text() {
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('图片位于行首Center')
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_start_center_0030')

        // 图片位于行首，水平对齐方式Start
        Text() {
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('图片位于行首Start')
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.Start)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_start_start_0030')

        // 图片位于行首，水平对齐方式End
        Text() {
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('图片位于行首End')
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.End)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_start_end_0030')

        // 图片位于中间，水平对齐方式未设定
        Text() {
          Span('前文本')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('后文本')
        }
        .width(300)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_middle_default_0030')

        // 图片位于中间，水平对齐方式Center
        Text() {
          Span('前文本')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('后文本')
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_middle_center_0030')

        // 图片位于中间，水平对齐方式Start
        Text() {
          Span('前文本')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('后文本')
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.Start)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_middle_start_0030')

        // 图片位于中间，水平对齐方式End
        Text() {
          Span('前文本')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
          Span('后文本')
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.End)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_middle_end_0030')

        // 图片位于行尾，水平对齐方式未设定
        Text() {
          Span('文本图片在行尾')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        }
        .width(300)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_end_default_0030')

        // 图片位于行尾，水平对齐方式Center
        Text() {
          Span('文本图片在行尾')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_end_center_0030')

        // 图片位于行尾，水平对齐方式Start
        Text() {
          Span('文本图片在行尾')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.Start)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_end_start_0030')

        // 图片位于行尾，水平对齐方式End
        Text() {
          Span('文本图片在行尾')
          ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        }
        .width(300)
        .fontSize(16)
        .textAlign(TextAlign.End)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_end_end_0030')
      }
      .width('100%')
      .padding(20)
    }
  }
}

