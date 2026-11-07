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
struct UiComponentCanvasOffscreenCanvasGpuDraw06 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)
  @State text :string = 'fillText("Hello World!", 50, 100)'

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
        .height('100%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          let ctx = this.context
          this.offContext.fillStyle = 'red';
          this.offContext.lineWidth = 3
          this.offContext.strokeStyle ='#0000ff'
          this.offContext.save();
          ctx.fillStyle = 'green';
          ctx.fillRect(20, 20, 100, 100);
          ctx.restore();
          this.offContext.fillRect(150, 75, 100, 100);
          this.offContext.strokeRect(150, 75, 100, 100);
          let image2:ImageBitmap = this.offContext.transferToImageBitmap()
          ctx.transferFromImageBitmap(image2)
          console.log('onReady success')
        })
    }
    .width('100%')
    .height('100%')
  }
}
