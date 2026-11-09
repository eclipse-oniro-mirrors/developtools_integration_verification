/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextHalfLeading10 {
  private ColorFilterMatrix: number[] = [1, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
  @State DrawingColorFilterFirst: ColorFilter | undefined = new ColorFilter(this.ColorFilterMatrix);
  @State halfleading : boolean = false
  @State lineHeight :number = 10
  @State textAlign:TextAlign=TextAlign.Center

  build() {
    Row() {
      Column({ space: 10 }) {
        Button('change halfleading')
          .onClick(()=>{
            this.halfleading=true
          })
          .fontSize(10)
          .height(50)
          .backgroundColor(0x317aff)
          .width('90%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .id('UiComponentTextHalfLeading10_01')
        Button('change lineHeight')
          .onClick(()=>{
            this.lineHeight+=20
          })
          .fontSize(10)
          .height(50)
          .backgroundColor(0x317aff)
          .width('90%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .id('UiComponentTextHalfLeading10_02')
        Text() {
          ContainerSpan(){
            Span('Hello World')
            Span('Hello World')
            Span('Hello World')
            Span('Hello World')
            ImageSpan('/icon.png')
              .width('60vp')
              .height('60vp')
            ImageSpan('/icon.png')
              .width('60vp')
              .height('60vp')
            ImageSpan('/icon.png')
              .width('60vp')
              .height('60vp')
            ImageSpan('/icon.png')
              .width('60vp')
              .height('60vp')
          }
        }
        .lineHeight(this.lineHeight)
        .halfLeading(this.halfleading)
        .width('90%')
        .fontSize(10)
        .textAlign(TextAlign.Center)
        .fontColor(0xCCCCCC)
      }
      .width('100%')
    }
    .height('100%')
  }
}