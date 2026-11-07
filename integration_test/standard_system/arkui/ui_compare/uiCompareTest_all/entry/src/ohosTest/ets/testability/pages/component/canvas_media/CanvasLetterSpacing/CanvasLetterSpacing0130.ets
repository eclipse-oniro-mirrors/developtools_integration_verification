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
struct CanvasLetterSpacing0130 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private canvasWidth: number = 300;

  build() {
    Column({ space: 20 }) {
      Text('Canvas letterSpacing 测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Divider()

      Text('测试说明')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('90%')

      Column({ space: 10 }) {
        Text('• 设置 letterSpacing 后文本长度 fillText 最大宽度均大于 Canvas 宽度')
          .fontSize(14)
          .width('90%')
        
        Text('• 设置间距大于 fillText 的最大宽度，并且超出 Canvas 宽度')
          .fontSize(14)
          .width('90%')
        
        Text(`• Canvas 宽度：${this.canvasWidth}px`)
          .fontSize(14)
          .fontColor(Color.Orange)
          .width('90%')
        
        Text('• 预期结果：maxWidth 大于 Canvas 组件宽度，超出部分会截断')
          .fontSize(14)
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .width('90%')
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .padding(15)
      .backgroundColor('#FFF9C4')
      .borderRadius(8)

      Divider()

      Text('Canvas 绘制区域')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('90%')

      Canvas(this.context)
        .width(this.canvasWidth)
        .height(400)
        .backgroundColor('#F5F5F5')
        .border({ width: 2, color: '#1E90FF', style: BorderStyle.Solid })
        .borderRadius(8)
        .onReady(() => {
          this.context.font = '30px sans-serif';
          
          this.context.letterSpacing = '20';
          
          this.context.fillStyle = '#FF0000';
          this.context.fillText('Hello World', 10, 80, 400);
          
          this.context.strokeStyle = '#FF0000';
          this.context.lineWidth = 2;
          this.context.strokeRect(10, 50, 280, 40);
          
          this.context.font = '12px sans-serif';
          this.context.letterSpacing = '0';
          this.context.fillStyle = '#FF0000';
          this.context.fillText('letterSpacing=20, maxWidth=400', 10, 100);
          this.context.fillText('(超出Canvas宽度300)', 10, 115);
          
          this.context.font = '30px sans-serif';
          this.context.letterSpacing = '20';
          this.context.fillStyle = '#0000FF';
          this.context.fillText('Hello World', 10, 200);
          
          this.context.font = '12px sans-serif';
          this.context.letterSpacing = '0';
          this.context.fillStyle = '#0000FF';
          this.context.fillText('letterSpacing=20, 无 maxWidth', 10, 220);
          this.context.fillText('(超出Canvas宽度)', 10, 235);
          
          this.context.font = '30px sans-serif';
          this.context.letterSpacing = '0';
          this.context.fillStyle = '#999999';
          this.context.fillText('Hello World', 10, 330, 280);
          
          this.context.strokeStyle = '#999999';
          this.context.lineWidth = 2;
          this.context.strokeRect(10, 300, 280, 40);
          
          this.context.font = '12px sans-serif';
          this.context.fillStyle = '#999999';
          this.context.fillText('letterSpacing=0, maxWidth=280', 10, 350);
          this.context.fillText('(在Canvas宽度内)', 10, 365);
        })

      Divider()

      Column({ space: 10 }) {
        Text('📍 验证要点')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
        
        Text('• 第1行（红色）：letterSpacing=20 + maxWidth=400(>Canvas宽度)，超出部分被截断')
          .fontSize(14)
          .width('100%')
        
        Text('• 第2行（蓝色）：letterSpacing=20 + 无maxWidth，超出Canvas边界被截断')
          .fontSize(14)
          .width('100%')
        
        Text('• 第3行（灰色）：letterSpacing=0 + maxWidth=280(<Canvas宽度)，完整显示')
          .fontSize(14)
          .width('100%')
        
        Text('• Canvas 宽度限制了最终的渲染范围，超出部分不可见')
          .fontSize(14)
          .fontColor(Color.Blue)
          .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .padding(15)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
      .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
