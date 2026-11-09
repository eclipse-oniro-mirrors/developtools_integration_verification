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
struct UiComponentTextCommonLineSpace15 {
  private currentIndex: number = 0;
  @State text: string = ''
  @State nums: number=10
  build() {
    Column() {
      Text('UiComponentTextCommonLineSpace15') {
        ContainerSpan() {
          Span('This is the Span with the height adaptive policy set!')
            .fontSize('16fp')
            .fontColor(Color.Black)
          Span('This is the Span with the height adaptive policy set')
            .fontSize('16fp')
            .fontColor(Color.Black)
        }
      }
      .width(336)
      .copyOption(CopyOptions.InApp)
      .height(500)
      .maxLines(2)
      .lineSpacing(LengthMetrics.vp(this.nums))
      Button('change size')
        .onClick(()=>{
          this.nums=50
        })
        .id('UiComponentTextCommonLineSpace15')
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}