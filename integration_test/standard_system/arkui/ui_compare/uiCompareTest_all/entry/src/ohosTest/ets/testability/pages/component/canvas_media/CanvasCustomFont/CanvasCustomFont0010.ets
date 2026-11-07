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

import { font } from '@kit.ArkUI';

@Entry
@Component
struct CanvasCustomFont0010 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State fontRegistered: boolean = false;
  @State registrationStatus: string = '正在注册字体...';
  @State customFontFamily: string = 'CustomTestFont';

  aboutToAppear() {
    this.registerCustomFont();
  }

  registerCustomFont() {
    try {
      font.registerFont({
        familyName: this.customFontFamily,
        familySrc: 'fonts/HarmonyOS_Sans_SC_Medium.ttf'
      });
      this.fontRegistered = true;
      this.registrationStatus = '✅ 字体注册成功';
      console.info('[CanvasCustomFont0010] Font registered successfully: ' + this.customFontFamily);
    } catch (error) {
      this.fontRegistered = false;
      this.registrationStatus = '❌ 字体注册失败: ' + JSON.stringify(error);
      console.error('[CanvasCustomFont0010] Font registration failed: ' + JSON.stringify(error));
    }
  }

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
          Text('• 注册自定义字体，使用正常字体文件路径')
            .fontSize(12)
            .width('90%')
          
          Text('• 路径：fonts/HarmonyOS_Sans_SC_Medium.ttf')
            .fontSize(12)
            .width('90%')
          
          Text('• 字体名称：' + this.customFontFamily)
            .fontSize(12)
            .width('90%')
          
          Text('• 预期结果：正常注册使用')
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
          
          Text(this.registrationStatus)
            .fontSize(12)
            .fontColor(this.fontRegistered ? Color.Green : Color.Red)
            .fontWeight(FontWeight.Bold)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding(10)
        .backgroundColor(this.fontRegistered ? '#E8F5E9' : '#FFEBEE')
        .borderRadius(8)

        Divider()

        Text('Canvas 绘制区域')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Canvas(this.context)
          .width('95%')
          .height(380)
          .backgroundColor('#F5F5F5')
          .border({ width: 2, color: '#1E90FF', style: BorderStyle.Solid })
          .borderRadius(8)
          .onReady(() => {
            if (this.fontRegistered) {
              // 使用自定义字体绘制文本
              this.context.font = '35px ' + this.customFontFamily;
              this.context.fillStyle = '#000000';
              this.context.fillText('自定义字体测试', 40, 60);
              this.context.fillText('Custom Font Test', 40, 110);
              
              // 添加标注
              this.context.font = '12px sans-serif';
              this.context.fillStyle = '#1E90FF';
              this.context.fillText('使用自定义字体: ' + this.customFontFamily, 40, 132);
              
              // 添加分隔线
              this.context.strokeStyle = '#FF0000';
              this.context.lineWidth = 2;
              this.context.setLineDash([5, 5]);
              this.context.beginPath();
              this.context.moveTo(30, 155);
              this.context.lineTo(370, 155);
              this.context.stroke();
              this.context.setLineDash([]);
              
              // 绘制对比文本（系统默认字体）
              this.context.font = '35px sans-serif';
              this.context.fillStyle = '#666666';
              this.context.fillText('系统默认字体', 40, 210);
              this.context.fillText('Default Font', 40, 260);
              
              this.context.font = '12px sans-serif';
              this.context.fillStyle = '#666666';
              this.context.fillText('使用系统字体: sans-serif', 40, 282);
              
              // 添加验证说明
              this.context.font = '11px sans-serif';
              this.context.fillStyle = '#999999';
              this.context.fillText('验证：对比上下两组文本的字体样式差异', 40, 320);
              this.context.fillText('红色虚线分隔自定义字体和系统字体', 40, 335);
            } else {
              // 字体注册失败时的提示
              this.context.font = '18px sans-serif';
              this.context.fillStyle = '#FF0000';
              this.context.fillText('字体注册失败，无法绘制', 40, 190);
            }
          })

        Divider()

        Column({ space: 8 }) {
          Text('📍 验证要点')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• 上方文本：使用自定义字体 "' + this.customFontFamily + '"')
            .fontSize(12)
            .width('100%')
          
          Text('• 下方文本：使用系统默认字体 "sans-serif"')
            .fontSize(12)
            .width('100%')
          
          Text('• 对比两组文本，可以看到字体样式的差异')
            .fontSize(12)
            .width('100%')
          
          Text('• 红色虚线分隔自定义字体和系统字体')
            .fontSize(12)
            .width('100%')
          
          Text('• 字体注册状态显示为"✅ 字体注册成功"')
            .fontSize(12)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
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