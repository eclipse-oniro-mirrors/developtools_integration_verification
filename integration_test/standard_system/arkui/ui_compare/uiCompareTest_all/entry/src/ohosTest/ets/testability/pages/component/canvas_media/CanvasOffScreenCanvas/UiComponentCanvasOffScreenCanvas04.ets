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

@Entry
@Component
struct UiComponentCanvasOffScreenCanvas04 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private settings2: RenderingContextSettings = new RenderingContextSettings(true);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings2);
  private offCanvas: OffscreenCanvas = new OffscreenCanvas(0,200);
  private offCanvas2: OffscreenCanvas = new OffscreenCanvas(200,200);
  @State text : string='set OffscreenCanvas\'s width to 0'
  @State text2 : string='set OffscreenCanvas\'s width to 200'

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      Column(){
        Text(this.text)
          .fontSize(10)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .textOverflow({ overflow: TextOverflow.None })
          .maxLines(2)
          .height(50)
        Row() {
          Canvas(this.context)
            .width('100%')
            .height('100%')
            .borderWidth(5)
            .borderColor('#057D02')
            .backgroundColor('#FFFFFF')
            .onReady(() => {
              let offContext = this.offCanvas.getContext('2d', this.settings)
              offContext.fillStyle = '#CDCDCD'
              offContext.fillRect(0, 0, this.offCanvas.height, 150)
              let image = this.offCanvas.transferToImageBitmap()
              this.context.setTransform(1, 0, 0, 1, 50, 200)
              this.context.transferFromImageBitmap(image)
            })
        }
        .width('100%')
        .height('40%')
        Text(this.text2)
          .fontSize(10)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .textOverflow({ overflow: TextOverflow.None })
          .maxLines(2)
          .height(50)
        Row() {
          Canvas(this.context2)
            .width('100%')
            .height('100%')
            .borderWidth(5)
            .borderColor('#057D02')
            .backgroundColor('#FFFFFF')
            .onReady(() => {
              let offContext = this.offCanvas2.getContext('2d', this.settings2)
              offContext.fillStyle = '#CDCDCD'
              offContext.fillRect(0, 0, this.offCanvas.height, 150)
              let image = this.offCanvas2.transferToImageBitmap()
              this.context2.setTransform(1, 0, 0, 1, 50, 200)
              this.context2.transferFromImageBitmap(image)
            })
        }
        .width('100%')
        .height('40%')
      }
    }.width('100%').height('100%')
  }
}
