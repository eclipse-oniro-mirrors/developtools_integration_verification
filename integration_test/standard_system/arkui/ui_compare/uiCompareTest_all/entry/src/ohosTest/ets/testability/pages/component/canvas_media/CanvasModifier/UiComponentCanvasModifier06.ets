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
struct UiComponentCanvasModifier06 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private matrix: Matrix2D = new Matrix2D();
  private img: ImageBitmap = new ImageBitmap('/icon.png');
  private pattern: CanvasPattern | null = null;
  @State text : string ='scaleX=1'

  build() {
    Column() {
      Button('Click to set transform')
        .onClick(() => {
          this.matrix.scaleY = 1
          this.matrix.scaleX = 1
          this.matrix.rotateX = 0
          this.matrix.rotateY = 0
          this.matrix.translateX = 0
          this.matrix.translateY = 0
          if (this.pattern) {
            this.pattern.setTransform(this.matrix)
          }
          this.context.fillRect(0, 0, 480, 720)
        })
        .width('45%')
        .margin('5px')
        .id('UiComponentCanvasModifier06')
      Canvas(this.context)
        .width('100%')
        .height('80%')
        .backgroundColor('#FFFFFF')
        .onReady(() => {
          this.pattern = this.context.createPattern(this.img, 'no-repeat')
          this.matrix.scaleY = 1
          this.matrix.scaleX = 1
          this.matrix.rotateX = 0
          this.matrix.rotateY = 0
          this.matrix.translateX = 0
          this.matrix.translateY = 0
          if (this.pattern) {
            this.context.fillStyle = this.pattern
            this.pattern.setTransform(this.matrix)
          }
          this.context.fillRect(0, 0, 480, 720)
        })
      Text(this.text)
        .fontSize(12)
        .fontColor(Color.Blue)
        .lineHeight(55)
        .textAlign(TextAlign.Center)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
