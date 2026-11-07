/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct Path2dAndCanvaspath2d0040 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .id('canvas_path2d_arc_0040')
        .backgroundColor('#FFFFFF')
        .onReady(() => {
          // 频繁调用arc方法进行绘制，验证性能
          let path2D: Path2D = new Path2D();
          // 频繁调用arc绘制多个圆弧
          for (let i = 0; i < 100; i++) {
            let x = 20 + (i % 10) * 30;
            let y = 20 + Math.floor(i / 10) * 30;
            path2D.arc(x, y, 10, 0, Math.PI * 2);
          }
          this.context.strokeStyle = '#FF00FF';
          this.context.lineWidth = 2;
          this.context.stroke(path2D);
        })
    }
    .width('100%')
    .height('100%')
  }
}
