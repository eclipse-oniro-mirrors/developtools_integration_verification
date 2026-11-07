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
struct UiComponentCanvasOffscreenCanvasGpuDraw35 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private settings2: RenderingContextSettings = new RenderingContextSettings(true)
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings2)
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)
  private offContext2: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings2)
  @State text :string = 'set measureText("Hello World!").ideographicBaseline'
  @State text2 :string = 'not set measureText("Hello World!").ideographicBaseline'
  private img:ImageBitmap = new ImageBitmap('/icon.png')

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
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(2)
        .height(100)
      Canvas(this.context)
        .width('100%')
        .height('40%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          let ctx = this.context
          ctx.font = '50px sans-serif'
          ctx.fillText('Hello World!', 20, 100)
          ctx.fillText('Text'+this.context.measureText('Hello World!').ideographicBaseline, 20, 200)
          console.log('onReady success')
        })
      Text(this.text2)
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(2)
        .height(100)
      Canvas(this.context2)
        .width('100%')
        .height('40%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          let ctx = this.context2
          ctx.font = '50px sans-serif'
          ctx.fillText('Hello World!', 20, 100)
          console.log('onReady success')
        })
    }
    .width('100%')
    .height('100%')
  }
}
