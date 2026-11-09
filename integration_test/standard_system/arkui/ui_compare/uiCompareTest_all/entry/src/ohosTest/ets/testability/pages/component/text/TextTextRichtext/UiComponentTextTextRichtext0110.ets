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
struct UiComponentTextTextRichtext0110 {
  @State fontSize1: number = 16;
  @State align1: ImageSpanAlignment = ImageSpanAlignment.BASELINE;
  @State align2: ImageSpanAlignment = ImageSpanAlignment.CENTER;
  @State align3: ImageSpanAlignment = ImageSpanAlignment.TOP;
  @State align4: ImageSpanAlignment = ImageSpanAlignment.BASELINE;
  @State align5: ImageSpanAlignment = ImageSpanAlignment.BOTTOM;
  @State align6: ImageSpanAlignment = ImageSpanAlignment.TOP;

  build() {
    Scroll() {
      Column() {
        // 页面描述
        Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        Text('测试名称：图片的垂直对齐(图文混排，多行多个图片)')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        // 第一行三张图片分别位于行首、中间和行尾(不相邻)，对齐方式分别为BASELINE、CENTER和TOP
        // 第二行三张图片都位于中间且相邻，对齐方式分别为BASELINE、BOTTOM和TOP
        Text() {
          ImageSpan($r('sys.media.ohos_app_icon'))
            .width(50)
            .height(50)
            .verticalAlign(this.align1)
          Span('第一行文本内容')
          ImageSpan($r('sys.media.ohos_app_icon'))
            .width(60)
            .height(60)
            .verticalAlign(this.align2)
          Span('文本内容')
          ImageSpan($r('sys.media.ohos_app_icon'))
            .width(55)
            .height(55)
            .verticalAlign(this.align3)
          Span('\n第二行文本')
          ImageSpan($r('sys.media.ohos_app_icon'))
            .width(50)
            .height(50)
            .verticalAlign(this.align4)
          ImageSpan($r('sys.media.ohos_app_icon'))
            .width(60)
            .height(60)
            .verticalAlign(this.align5)
          ImageSpan($r('sys.media.ohos_app_icon'))
            .width(55)
            .height(55)
            .verticalAlign(this.align6)
          Span('文本内容')
        }
        .width('90%')
        .fontSize(this.fontSize1)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_multi_images_0110')

        Text('动态改变图片对齐方式：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Row() {
          Button('图1→BOTTOM')
            .onClick(() => {
              this.align1 = ImageSpanAlignment.BOTTOM;
            })
            .margin(5)
            .fontSize(12)
            .id('button_change_align1_0110')

          Button('图2→TOP')
            .onClick(() => {
              this.align2 = ImageSpanAlignment.TOP;
            })
            .margin(5)
            .fontSize(12)
            .id('button_change_align2_0110')

          Button('图3→BASELINE')
            .onClick(() => {
              this.align3 = ImageSpanAlignment.BASELINE;
            })
            .margin(5)
            .fontSize(12)
            .id('button_change_align3_0110')
        }

        Row() {
          Button('图4→CENTER')
            .onClick(() => {
              this.align4 = ImageSpanAlignment.CENTER;
            })
            .margin(5)
            .fontSize(12)
            .id('button_change_align4_0110')

          Button('图5→TOP')
            .onClick(() => {
              this.align5 = ImageSpanAlignment.TOP;
            })
            .margin(5)
            .fontSize(12)
            .id('button_change_align5_0110')

          Button('图6→BOTTOM')
            .onClick(() => {
              this.align6 = ImageSpanAlignment.BOTTOM;
            })
            .margin(5)
            .fontSize(12)
            .id('button_change_align6_0110')
        }

        Text('动态改变字体大小：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Row() {
          Button('字体大小为20')
            .onClick(() => {
              this.fontSize1 = 20;
            })
            .margin(5)
            .id('button_change_fontsize_large_0110')

          Button('字体大小为12')
            .onClick(() => {
              this.fontSize1 = 12;
            })
            .margin(5)
            .id('button_change_fontsize_small_0110')

          Button('恢复默认16')
            .onClick(() => {
              this.fontSize1 = 16;
            })
            .margin(5)
            .id('button_change_fontsize_default_0110')
        }
      }
      .width('100%')
      .padding(20)
    }
  }
}

