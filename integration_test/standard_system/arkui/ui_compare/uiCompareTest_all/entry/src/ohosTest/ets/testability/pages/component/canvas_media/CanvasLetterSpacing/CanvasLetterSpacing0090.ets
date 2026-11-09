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

import { LengthMetrics, LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct CanvasLetterSpacing0090 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

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
        Text('• 使用 LengthMetricsUnit 单位')
          .fontSize(14)
          .width('90%')
        
        Text('• 设置 letterSpacing = new LengthMetrics(5, LengthUnit.FP)')
          .fontSize(14)
          .width('90%')
        
        Text('• 调用 fillText("Hello World", 50, 108)')
          .fontSize(14)
          .width('90%')
        
        Text('• 预期结果：无效值，默认0间距')
          .fontSize(14)
          .fontColor(Color.Red)
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
        .width('95%')
        .height(300)
        .backgroundColor('#F5F5F5')
        .border({ width: 2, color: '#1E90FF', style: BorderStyle.Solid })
        .borderRadius(8)
        .onReady(() => {
          this.context.font = '30px sans-serif';
          
          this.context.letterSpacing = new LengthMetrics(5, LengthUnit.FP);
          
          this.context.fillStyle = '#000000';
          
          this.context.fillText('Hello World', 50, 108);
          
          this.context.strokeStyle = '#FF0000';
          this.context.lineWidth = 1;
          this.context.beginPath();
          this.context.moveTo(50, 0);
          this.context.lineTo(50, 300);
          this.context.stroke();
          
          this.context.font = '12px sans-serif';
          this.context.fillStyle = '#FF0000';
          this.context.fillText('测试文本 (50, 108) - 无效单位FP', 10, 128);
          
          this.context.font = '30px sans-serif';
          this.context.letterSpacing = new LengthMetrics(5, LengthUnit.VP);
          this.context.fillStyle = '#0000FF';
          this.context.fillText('Hello World', 50, 188);
          
          this.context.font = '12px sans-serif';
          this.context.fillStyle = '#0000FF';
          this.context.fillText('对比：LengthMetrics(5, VP)（有效）', 10, 208);
        })

      Divider()

      Column({ space: 10 }) {
        Text('📍 验证要点')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
        
        Text('• 上方文本：LengthMetrics(5, LengthUnit.FP)（无效单位），字符间距为0')
          .fontSize(14)
          .width('100%')
        
        Text('• 下方文本：LengthMetrics(5, LengthUnit.VP)（有效单位），字符间距明显增大')
          .fontSize(14)
          .width('100%')
        
        Text('• 对比两行文本，上方文本应与正常间距相同')
          .fontSize(14)
          .width('100%')
        
        Text('• LengthUnit.FP 不是有效的长度单位，系统会忽略该设置')
          .fontSize(14)
          .fontColor(Color.Red)
          .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .padding(15)
      .backgroundColor('#FFEBEE')
      .borderRadius(8)
      .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
