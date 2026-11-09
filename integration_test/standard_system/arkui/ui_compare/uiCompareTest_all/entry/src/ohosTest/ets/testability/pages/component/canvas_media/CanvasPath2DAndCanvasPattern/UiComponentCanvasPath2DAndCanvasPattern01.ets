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
struct UiComponentCanvasPath2DAndCanvasPattern01 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private settings2: RenderingContextSettings = new RenderingContextSettings(true)
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings2)
  private offContext2: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings2)
  private matrix: Matrix2D = new Matrix2D();
  @State text :string = 'not set matrix '
  @State text2 :string = 'set rotateX to 0.5'

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
        .maxLines(1)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .height(100)
      Canvas(this.context)
        .width('100%')
        .height('40%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          let ctx = this.context
          this.context.fillRect(100, 110, 50, 50)
          console.log('onReady success')
        })
      Text(this.text2)
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .padding(10)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(2)
        .height(100)
      Canvas(this.context2)
        .width('100%')
        .height('40%')
        .backgroundColor('#ffff00')
        .onReady(() =>{
          let ctx = this.context2
          this.matrix.scaleX = 1
          this.matrix.rotateX = 0.5
          this.matrix.rotateY = 0
          this.matrix.scaleY = 1
          this.matrix.translateX = 0
          this.matrix.translateY = 0
          ctx.setTransform(this.matrix)
          ctx.fillRect(100, 110, 50, 50)
          console.log('onReady success')
        })
    }
    .width('100%')
    .height('100%')
  }
}
