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
struct CanvasCustomFont0070 {
  private settings1: RenderingContextSettings = new RenderingContextSettings(true);
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings1);
  private settings2: RenderingContextSettings = new RenderingContextSettings(true);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings2);
  private settings3: RenderingContextSettings = new RenderingContextSettings(true);
  private context3: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings3);
  
  @State font1Registered: boolean = false;
  @State font2Registered: boolean = false;
  @State registrationStatus: string = '正在注册字体...';
  @State font1Name: string = 'MultiCanvasFont1';
  @State font2Name: string = 'MultiCanvasFont2';

  aboutToAppear() {
    this.registerMultipleFonts();
  }

  registerMultipleFonts() {
    let statusMessages: string[] = [];
    
    // 注册第一个字体（有效）
    try {
      font.registerFont({
        familyName: this.font1Name,
        familySrc: 'fonts/HarmonyOS_Sans_SC_Medium.ttf'
      });
      this.font1Registered = true;
      statusMessages.push('✅ 字体1注册成功: ' + this.font1Name);
      console.info('[CanvasCustomFont0070] Font1 registered: ' + this.font1Name);
    } catch (error) {
      this.font1Registered = false;
      statusMessages.push('❌ 字体1注册失败: ' + this.font1Name);
      console.error('[CanvasCustomFont0070] Font1 registration failed: ' + JSON.stringify(error));
    }
    
    // 注册第二个字体（无效路径，用于测试）
    try {
      font.registerFont({
        familyName: this.font2Name,
        familySrc: 'fonts/invalid_path/test_font.ttf'
      });
      this.font2Registered = true;
      statusMessages.push('⚠️ 字体2注册成功（异常）: ' + this.font2Name);
      console.info('[CanvasCustomFont0070] Font2 registered: ' + this.font2Name);
    } catch (error) {
      this.font2Registered = false;
      statusMessages.push('✅ 字体2注册失败（预期）: ' + this.font2Name);
      console.error('[CanvasCustomFont0070] Font2 registration failed: ' + JSON.stringify(error));
    }
    
    this.registrationStatus = statusMessages.join('\n');
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
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
          Text('• 注册多个自定义字体，有无效值')
            .fontSize(12)
            .width('90%')
          
          Text('• 创建多个 Canvas 组件')
            .fontSize(12)
            .width('90%')
          
          Text('• 分别单独指定不同字体')
            .fontSize(12)
            .fontColor(Color.Blue)
            .width('90%')
          
          Text('• 预期：显示 Canvas 组件对应设置的字体')
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

        Text('Canvas 1 - 使用字体1')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Canvas(this.context1)
          .width('95%')
          .height(140)
          .backgroundColor('#F5F5F5')
          .border({ width: 2, color: '#1E90FF', style: BorderStyle.Solid })
          .borderRadius(8)
          .onReady(() => {
            if (this.font1Registered) {
              this.context1.font = '30px ' + this.font1Name;
              this.context1.fillStyle = '#000000';
              this.context1.fillText('Canvas 1 字体测试', 30, 50);
              
              this.context1.font = '11px sans-serif';
              this.context1.fillStyle = '#1E90FF';
              this.context1.fillText('字体: ' + this.font1Name + ' (有效)', 30, 70);
            } else {
              this.context1.font = '16px sans-serif';
              this.context1.fillStyle = '#FF0000';
              this.context1.fillText('字体1注册失败', 30, 50);
            }
          })

        Divider()

        Text('Canvas 2 - 使用字体2')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Canvas(this.context2)
          .width('95%')
          .height(140)
          .backgroundColor('#F5F5F5')
          .border({ width: 2, color: '#FF6600', style: BorderStyle.Solid })
          .borderRadius(8)
          .onReady(() => {
            this.context2.font = '30px ' + this.font2Name;
            this.context2.fillStyle = '#FF6600';
            this.context2.fillText('Canvas 2 字体测试', 30, 50);
            
            this.context2.font = '11px sans-serif';
            this.context2.fillStyle = '#FF6600';
            this.context2.fillText('字体: ' + this.font2Name + ' (无效，回退默认)', 30, 70);
          })

        Divider()

        Text('Canvas 3 - 使用系统字体')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Canvas(this.context3)
          .width('95%')
          .height(140)
          .backgroundColor('#F5F5F5')
          .border({ width: 2, color: '#666666', style: BorderStyle.Solid })
          .borderRadius(8)
          .onReady(() => {
            this.context3.font = '30px sans-serif';
            this.context3.fillStyle = '#666666';
            this.context3.fillText('Canvas 3 系统字体', 30, 50);
            
            this.context3.font = '11px sans-serif';
            this.context3.fillStyle = '#666666';
            this.context3.fillText('字体: sans-serif (系统默认)', 30, 70);
          })

        Divider()

        Column({ space: 8 }) {
          Text('📍 验证要点')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• Canvas 1：使用有效自定义字体')
            .fontSize(12)
            .width('100%')
          
          Text('• Canvas 2：使用无效字体，回退到默认')
            .fontSize(12)
            .width('100%')
          
          Text('• Canvas 3：使用系统默认字体')
            .fontSize(12)
            .width('100%')
          
          Text('• 三个 Canvas 应显示不同的字体效果')
            .fontSize(12)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• Canvas 1 与 Canvas 3 字体样式应不同')
            .fontSize(12)
            .fontColor(Color.Blue)
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
