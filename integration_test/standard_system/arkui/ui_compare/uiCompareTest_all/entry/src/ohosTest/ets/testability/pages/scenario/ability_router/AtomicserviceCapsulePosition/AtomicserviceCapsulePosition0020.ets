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

import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct AtomicserviceCapsulePosition0020 {
  @State xPosition: number = 0;
  @State yPosition: number = 0;
  @State widthValue: number = 0;
  @State heightValue: number = 0;
  @State showOverlay: boolean = false;
  @State errorInfo: string = '';
  private uiContext: UIContext | null = null;

  aboutToAppear(): void {
    setTimeout(() => {
      this.getCapsulePosition();
    }, 500);
  }

  getCapsulePosition(): void {
    try {
      this.uiContext = this.getUIContext();
      if (this.uiContext) {
        const atomicServiceBar = this.uiContext.getAtomicServiceBar();
        console.info('atomicServiceBar:', atomicServiceBar);
        
        if (atomicServiceBar) {
          const barRect = atomicServiceBar.getBarRect();
          console.info('barRect:', JSON.stringify(barRect));
          
          if (barRect) {
            this.xPosition = Number(barRect.x) || 0;
            this.yPosition = Number(barRect.y) || 0;
            this.widthValue = Number(barRect.width) || 0;
            this.heightValue = Number(barRect.height) || 0;
            
            if (this.xPosition === 0 && this.yPosition === 0 && this.widthValue === 0 && this.heightValue === 0) {
              this.errorInfo = '胶囊位置信息全为0，可能胶囊不可见';
            } else {
              this.errorInfo = '';
            }
            console.info('胶囊位置信息:', `x:${this.xPosition}, y:${this.yPosition}, w:${this.widthValue}, h:${this.heightValue}`);
          } else {
            this.errorInfo = 'getBarRect返回null';
            console.warn('getBarRect返回null');
          }
        } else {
          this.errorInfo = 'AtomicServiceBar不可用，可能不是原子化服务环境';
          console.warn('AtomicServiceBar不可用');
        }
      } else {
        this.errorInfo = 'UIContext未初始化';
        console.error('UIContext未初始化');
      }
    } catch (error) {
      this.errorInfo = `获取胶囊位置失败: ${error}`;
      console.error('获取胶囊位置失败:', error);
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column({ space: 20 }) {
        Text('胶囊位置信息测试')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        Divider()

        Text('获取到的胶囊位置信息：')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Column({ space: 15 }) {
          Row() {
            Text('X坐标:')
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .width('35%')
            Text(`${this.xPosition} px`)
              .fontSize(22)
              .fontColor(this.xPosition > 0 ? Color.Blue : Color.Red)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ left: 10, right: 10 })

          Row() {
            Text('Y坐标:')
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .width('35%')
            Text(`${this.yPosition} px`)
              .fontSize(22)
              .fontColor(this.yPosition > 0 ? Color.Blue : Color.Red)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ left: 10, right: 10 })

          Row() {
            Text('宽度(Width):')
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .width('35%')
            Text(`${this.widthValue} px`)
              .fontSize(22)
              .fontColor(this.widthValue > 0 ? Color.Blue : Color.Red)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ left: 10, right: 10 })

          Row() {
            Text('高度(Height):')
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .width('35%')
            Text(`${this.heightValue} px`)
              .fontSize(22)
              .fontColor(this.heightValue > 0 ? Color.Blue : Color.Red)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ left: 10, right: 10 })
        }
        .width('100%')
        .padding(20)
        .backgroundColor('#F0F8FF')
        .borderRadius(10)
        .border({ width: 2, color: '#1E90FF', style: BorderStyle.Solid })

        if (this.errorInfo) {
          Column() {
            Text('状态信息：')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Red)
            
            Text(this.errorInfo)
              .fontSize(14)
              .fontColor(Color.Red)
              .margin({ top: 5 })
          }
          .width('100%')
          .padding(15)
          .backgroundColor('#FFE4E1')
          .borderRadius(8)
          .alignItems(HorizontalAlign.Start)
        }

        Divider()

        Row({ space: 10 }) {
          Button('刷新位置')
            .fontSize(18)
            .width('48%')
            .height(55)
            .backgroundColor('#4CAF50')
            .onClick(() => {
              console.info('=== 开始刷新位置 ===');
              this.getCapsulePosition();
              console.info(`刷新后的值: x=${this.xPosition}, y=${this.yPosition}, w=${this.widthValue}, h=${this.heightValue}`);
            })

          Button(this.showOverlay ? '隐藏标记' : '显示标记')
            .fontSize(18)
            .width('48%')
            .height(55)
            .backgroundColor(this.showOverlay ? '#FF9800' : '#2196F3')
            .onClick(() => {
              this.showOverlay = !this.showOverlay;
              console.info('showOverlay:', this.showOverlay);
              console.info('位置信息:', `x:${this.xPosition}, y:${this.yPosition}, w:${this.widthValue}, h:${this.heightValue}`);
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        if (this.showOverlay) {
          Text(`✓ 标记框已显示 ${this.widthValue > 0 ? '(位置: 屏幕顶部右上角)' : '(测试位置: 100, 100)'}`)
            .fontSize(15)
            .fontColor(this.widthValue > 0 ? Color.Green : Color.Orange)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .width('100%')
            .padding(10)
            .backgroundColor(this.widthValue > 0 ? '#E8F5E9' : '#FFF3E0')
            .borderRadius(8)
        }

        Divider()

        Divider()

        Column({ space: 10 }) {
          Text('📍 胶囊位置说明')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .width('100%')
          
          Text('• 位置：屏幕顶部右上角（系统级组件）')
            .fontSize(14)
            .width('100%')
          
          Text('• 显示条件：原子化服务应用 + API 15+')
            .fontSize(14)
            .width('100%')
          
          Text('• 测试方法：点击"刷新位置"查看数值，点击"显示标记"验证位置')
            .fontSize(14)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding(15)
        .backgroundColor('#FFF9C4')
        .borderRadius(8)
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(Color.White)

      if (this.showOverlay) {
        if (this.widthValue > 0 && this.heightValue > 0) {
          Column()
            .width(this.widthValue)
            .height(this.heightValue)
            .backgroundColor('rgba(255, 0, 0, 0.5)')
            .border({ width: 3, color: Color.Red, style: BorderStyle.Solid })
            .position({ x: this.xPosition, y: this.yPosition })
            .zIndex(999)
        } else {
          Column()
            .width('13.89%')
            .height('4.1%')
            .backgroundColor('rgba(255, 0, 0, 0.5)')
            .border({ width: 3, color: Color.Red, style: BorderStyle.Solid })
            .position({ x: 100, y: 100 })
            .zIndex(999)
          
          Text('测试标记框(100,100)')
            .fontSize(12)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .padding(5)
            .position({ x: 100, y: 160 })
            .zIndex(999)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}

