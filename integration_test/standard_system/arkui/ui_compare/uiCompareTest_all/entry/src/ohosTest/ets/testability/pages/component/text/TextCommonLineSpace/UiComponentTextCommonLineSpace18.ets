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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct UiComponentTextCommonLineSpace18 {
  controller: TextAreaController = new TextAreaController()
  @State nums: number=100
  @State text: string = 'This is the TextArea with \n the height adaptive policy set' +
    'This is the TextArea \n with the height adaptive policy set'
  build() {
    Column({ space: 8 }) {
      Text('hello world') {
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(96)
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(96)
        ImageSpan($r('app.media.app_icon'))
          .width('60vp')
          .height('60vp')
          .verticalAlign(ImageSpanAlignment.CENTER)
          .textBackgroundStyle({color: Color.Green, radius: '5vp'})
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(96)
      }
      .lineSpacing(LengthMetrics.px(this.nums))
      .width(336)
      .copyOption(CopyOptions.InApp)
      .height(200)
      .maxLines(3)
      Text('hello world') {
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(96)
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(96)
        ImageSpan($r('app.media.app_icon'))
          .width('60vp')
          .height('60vp')
          .verticalAlign(ImageSpanAlignment.CENTER)
          .textBackgroundStyle({color: Color.Green, radius: '5vp'})
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(96)
      }
      .lineSpacing(LengthMetrics.px(this.nums+100))
      .width(336)
      .copyOption(CopyOptions.InApp)
      .height(200)
      .maxLines(3)
    }
  }
}
