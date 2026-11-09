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
struct UiComponentCanvasOffscreenCanvasGpuDraw130 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private settings2: RenderingContextSettings = new RenderingContextSettings(true)
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings2)
  private img:ImageBitmap = new ImageBitmap('/icon.png');
  @State text :string = 'Quality is high'
  @State text2 :string = 'Quality is not set'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.text)
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(2)
        .height(100)
      Canvas(this.context)
        .width('40%')
        .height('40%')
        .backgroundColor('#ffff00')
        .enableAnalyzer(true)
        .onReady(() => {
          let ctx = this.context
          let img = this.img
          ctx.imageSmoothingQuality = 'high'
          ctx.drawImage(img, 0, 0, 100, 100);
          this.context.font = '10px'
          this.context.fillText('hello world',10,10)
          this.context.font = '10px'
          this.context.strokeText('hello world',10,10)
          console.log('context onReady')
        })

      Text(this.text2)
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .height(100)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .padding(10)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(1)
      Canvas(this.context2)
        .width('40%')
        .height('40%')
        .backgroundColor('#ffff00')
        .enableAnalyzer(true)
        .onReady(() => {
          let ctx = this.context2
          let img = this.img
          ctx.imageSmoothingEnabled = false
          ctx.drawImage(img, 0, 0, 100, 100);
          this.context2.font = '10px'
          this.context2.fillText('hello world',10,10)
          this.context2.font = '10px'
          this.context2.strokeText('hello world',10,10)
          console.log('context2 onReady')
        })
    }
    .width('100%')
    .height('100%')
  }
}
