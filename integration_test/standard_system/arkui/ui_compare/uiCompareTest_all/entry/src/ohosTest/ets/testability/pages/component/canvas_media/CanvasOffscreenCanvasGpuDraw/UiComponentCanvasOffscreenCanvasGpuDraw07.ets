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
struct UiComponentCanvasOffscreenCanvasGpuDraw07 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private settings2: RenderingContextSettings = new RenderingContextSettings(true)
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings2)
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)
  @State text :string = 'fillRect=(100,100,-100,100)'
  @State text2 :string = 'fillRect=(100,100,100,100)'

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
          ctx.fillStyle = 'green';
          this.context.font = '50px sans-serif';
          this.context.fillText('Hello World!', 20, 20);
          this.context.font = '50px sans-serif';
          this.context.fillText('Hello World!', 100, 100);
          ctx.fillRect(100,100,-100,100)
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
          ctx.fillStyle = 'green';
          this.context2.font = '50px sans-serif';
          this.context2.fillText('Hello World!', 20, 20);
          this.context2.font = '50px sans-serif';
          this.context2.fillText('Hello World!', 100, 100)
          ctx.fillRect(100, 100, 100, 100);
          console.log('onReady success')
        })
    }
    .width('100%')
    .height('100%')
  }
}
