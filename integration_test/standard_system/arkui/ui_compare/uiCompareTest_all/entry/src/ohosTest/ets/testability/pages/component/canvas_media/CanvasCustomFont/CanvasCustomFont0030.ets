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
struct CanvasCustomFont0030 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State unregisteredFontFamily: string = 'UnregisteredInvalidFont';

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('Canvas 自定义字体测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Divider()

        Text('测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Column({ space: 8 }) {
          Text('• 未注册字体，指定字体名称（无效值）')
            .fontSize(12)
            .width('90%')
          
          Text('• 字体名称：' + this.unregisteredFontFamily + '（未注册）')
            .fontSize(12)
            .fontColor(Color.Red)
            .width('90%')
          
          Text('• 不调用 font.registerFont() 注册字体')
            .fontSize(12)
            .width('90%')
          
          Text('• 预期：使用默认字体展示')
            .fontSize(12)
            .fontColor(Color.Blue)
            .fontWeight(FontWeight.Bold)
            .width('90%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF9C4')
        .borderRadius(8)

        Divider()

        Column({ space: 8 }) {
          Text('字体注册状态')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('⚠️ 未注册任何字体')
            .fontSize(12)
            .fontColor(Color.Orange)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('✓ 使用未注册字体名称，应回退到系统默认字体')
            .fontSize(11)
            .fontColor(Color.Green)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)

        Divider()

        Text('Canvas 绘制区域')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Canvas(this.context)
          .width('95%')
          .height(450)
          .backgroundColor('#F5F5F5')
          .border({ width: 2, color: '#1E90FF', style: BorderStyle.Solid })
          .borderRadius(8)
          .onReady(() => {
            // 尝试使用未注册的字体（应该回退到默认字体）
            this.context.font = '35px ' + this.unregisteredFontFamily;
            this.context.fillStyle = '#FF0000';
            this.context.fillText('未注册字体测试', 40, 50);
            this.context.fillText('Unregistered Font', 40, 95);
            
            this.context.font = '12px sans-serif';
            this.context.fillStyle = '#FF0000';
            this.context.fillText('字体: ' + this.unregisteredFontFamily + ' (未注册)', 40, 117);
            
            // 添加分隔线
            this.context.strokeStyle = '#CCCCCC';
            this.context.lineWidth = 1;
            this.context.setLineDash([5, 5]);
            this.context.beginPath();
            this.context.moveTo(30, 140);
            this.context.lineTo(370, 140);
            this.context.stroke();
            this.context.setLineDash([]);
            
            // 绘制默认字体对比
            this.context.font = '35px sans-serif';
            this.context.fillStyle = '#000000';
            this.context.fillText('Sans-serif Test', 40, 190);
            
            this.context.font = '12px sans-serif';
            this.context.fillStyle = '#1E90FF';
            this.context.fillText('字体: sans-serif', 40, 212);
            
            // serif 字体
            this.context.font = '35px serif';
            this.context.fillStyle = '#006400';
            this.context.fillText('Serif Font Test', 40, 275);
            
            this.context.font = '12px sans-serif';
            this.context.fillStyle = '#006400';
            this.context.fillText('字体: serif', 40, 297);
            
            // monospace 字体
            this.context.font = '35px monospace';
            this.context.fillStyle = '#8B4513';
            this.context.fillText('Monospace Test', 40, 360);
            
            this.context.font = '12px sans-serif';
            this.context.fillStyle = '#8B4513';
            this.context.fillText('字体: monospace', 40, 382);
            
            // 添加验证说明
            this.context.font = '11px sans-serif';
            this.context.fillStyle = '#666666';
            this.context.fillText('验证：红色文本应与黑色文本字体相同', 40, 415);
            this.context.fillText('（都使用 sans-serif 默认字体）', 40, 430);
          })

        Divider()

        Column({ space: 8 }) {
          Text('📍 验证要点')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• 红色：未注册字体→回退到 sans-serif')
            .fontSize(12)
            .width('100%')
          
          Text('• 黑色：sans-serif 字体')
            .fontSize(12)
            .width('100%')
          
          Text('• 绿色：serif 字体')
            .fontSize(12)
            .width('100%')
          
          Text('• 棕色：monospace 字体')
            .fontSize(12)
            .width('100%')
          
          Text('• 红色与黑色字体样式应相同')
            .fontSize(12)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• 所有文本正常显示，使用默认字体')
            .fontSize(12)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)
        .margin({ bottom: 10 })
      }
      .width('100%')
      .padding({ left: 15, right: 15, top: 10, bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .scrollBar(BarState.Auto)
    .scrollable(ScrollDirection.Vertical)
    .edgeEffect(EdgeEffect.Spring)
  }
}
