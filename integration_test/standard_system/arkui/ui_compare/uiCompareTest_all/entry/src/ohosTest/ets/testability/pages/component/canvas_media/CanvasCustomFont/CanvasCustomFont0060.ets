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
struct CanvasCustomFont0060 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State firstFontRegistered: boolean = false;
  @State secondFontRegistered: boolean = false;
  @State registrationStatus: string = '正在注册字体...';
  @State duplicateFontName: string = 'DuplicateTestFont';

  aboutToAppear() {
    this.registerDuplicateFonts();
  }

  registerDuplicateFonts() {
    let statusMessages: string[] = [];
    
    // 首次注册（使用有效路径）
    try {
      font.registerFont({
        familyName: this.duplicateFontName,
        familySrc: 'fonts/HarmonyOS_Sans_SC_Medium.ttf'
      });
      this.firstFontRegistered = true;
      statusMessages.push('✅ 首次注册成功: ' + this.duplicateFontName);
      statusMessages.push('   路径: fonts/HarmonyOS_Sans_SC_Medium.ttf');
      console.info('[CanvasCustomFont0060] First font registered: ' + this.duplicateFontName);
    } catch (error) {
      this.firstFontRegistered = false;
      statusMessages.push('❌ 首次注册失败: ' + this.duplicateFontName);
      console.error('[CanvasCustomFont0060] First font registration failed: ' + JSON.stringify(error));
    }
    
    // 第二次注册（使用相同名称，不同路径）
    try {
      font.registerFont({
        familyName: this.duplicateFontName,
        familySrc: 'fonts/another_path/another_font.ttf'
      });
      this.secondFontRegistered = true;
      statusMessages.push('⚠️ 第二次注册成功（名称重复）: ' + this.duplicateFontName);
      statusMessages.push('   路径: fonts/another_path/another_font.ttf');
      console.info('[CanvasCustomFont0060] Second font registered with duplicate name');
    } catch (error) {
      this.secondFontRegistered = false;
      statusMessages.push('✅ 第二次注册失败（名称重复，预期）');
      console.error('[CanvasCustomFont0060] Second font registration failed: ' + JSON.stringify(error));
    }
    
    this.registrationStatus = statusMessages.join('\n');
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
          Text('• 注册多个自定义字体，name 重复')
            .fontSize(12)
            .width('90%')
          
          Text('• 字体名称：' + this.duplicateFontName + '（两次注册使用相同名称）')
            .fontSize(12)
            .fontColor(Color.Blue)
            .width('90%')
          
          Text('• 首次注册：fonts/HarmonyOS_Sans_SC_Medium.ttf')
            .fontSize(12)
            .width('90%')
          
          Text('• 第二次注册：fonts/another_path/another_font.ttf')
            .fontSize(12)
            .width('90%')
          
          Text('• 预期：使用首个注册的字体展示效果')
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
            .fontSize(11)
            .fontColor(Color.Black)
            .width('100%')
            .lineHeight(18)
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F5E9')
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
            if (this.firstFontRegistered) {
              // 使用重复名称的字体（应该使用首次注册的字体）
              this.context.font = '35px ' + this.duplicateFontName;
              this.context.fillStyle = '#000000';
              this.context.fillText('重复名称字体测试', 40, 60);
              this.context.fillText('Duplicate Name Test', 40, 110);
              
              this.context.font = '12px sans-serif';
              this.context.fillStyle = '#1E90FF';
              this.context.fillText('字体: ' + this.duplicateFontName, 40, 132);
              this.context.fillText('（应使用首次注册的字体）', 40, 147);
              
              // 添加分隔线
              this.context.strokeStyle = '#FF0000';
              this.context.lineWidth = 2;
              this.context.setLineDash([5, 5]);
              this.context.beginPath();
              this.context.moveTo(30, 170);
              this.context.lineTo(370, 170);
              this.context.stroke();
              this.context.setLineDash([]);
              
              // 绘制对比文本（系统默认字体）
              this.context.font = '35px sans-serif';
              this.context.fillStyle = '#666666';
              this.context.fillText('系统默认字体', 40, 225);
              
              this.context.font = '12px sans-serif';
              this.context.fillStyle = '#666666';
              this.context.fillText('字体: sans-serif（对比）', 40, 247);
              
              // 添加验证说明
              this.context.font = '11px sans-serif';
              this.context.fillStyle = '#999999';
              this.context.fillText('验证：上方应使用首次注册的字体', 40, 290);
              this.context.fillText('第二次注册应被忽略或覆盖失败', 40, 305);
            } else {
              this.context.font = '18px sans-serif';
              this.context.fillStyle = '#FF0000';
              this.context.fillText('字体注册失败', 40, 190);
            }
          })

        Divider()

        Column({ space: 8 }) {
          Text('📍 验证要点')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• 黑色文本：使用重复名称的字体')
            .fontSize(12)
            .width('100%')
          
          Text('• 应使用首次注册的字体效果')
            .fontSize(12)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• 第二次注册应被忽略或失败')
            .fontSize(12)
            .width('100%')
          
          Text('• 灰色文本：系统默认字体对比')
            .fontSize(12)
            .width('100%')
          
          Text('• 红色虚线分隔自定义字体和系统字体')
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
