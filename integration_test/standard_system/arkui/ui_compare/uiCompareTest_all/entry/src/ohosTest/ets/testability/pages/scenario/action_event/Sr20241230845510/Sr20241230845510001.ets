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
struct Sr20241230845510001 {
  @State currentPageIndex: number = 0;
  @State animationAngle: number = 0;
  @State animationScale: number = 1.0;
  @State animationOpacity: number = 1.0;
  @State isAnimationRunning: boolean = false;
  private animationTimer: number = -1;

  aboutToAppear(): void {
    // 页面加载时启动动效
    console.log('[PageLifecycle] Symbol page aboutToAppear - 页面即将出现');
    this.startAnimation();
  }

  aboutToDisappear(): void {
    // 页面销毁时停止动效
    console.log('[PageLifecycle] Symbol page aboutToDisappear - 页面即将消失');
    this.stopAnimation();
  }

  onPageShow(): void {
    // 页面显示时启动动效
    console.log('[PageLifecycle] Symbol page onPageShow - 页面显示');
    this.startAnimation();
  }

  onPageHide(): void {
    // 页面隐藏时停止动效
    console.log('[PageLifecycle] Symbol page onPageHide - 页面隐藏');
    this.stopAnimation();
  }

  // 启动动效
  startAnimation(): void {
    if (!this.isAnimationRunning) {
      this.isAnimationRunning = true;
      console.log('[Animation] Symbol animation started - 循环动效启动');
      
      this.animationTimer = setInterval(() => {
        this.animationAngle = (this.animationAngle + 15) % 360;
        this.animationScale = 1.0 + 0.3 * Math.sin(this.animationAngle * Math.PI / 180);
        this.animationOpacity = 0.6 + 0.4 * Math.cos(this.animationAngle * Math.PI / 180);
      }, 80);
    }
  }

  // 停止动效
  stopAnimation(): void {
    if (this.isAnimationRunning) {
      this.isAnimationRunning = false;
      console.log('[Animation] Symbol animation stopped - 循环动效停止');
      
      if (this.animationTimer !== -1) {
        clearInterval(this.animationTimer);
        this.animationTimer = -1;
      }
    }
  }

  // 切换页面
  switchPage(pageIndex: number): void {
    console.log(`[PageSwitch] Switching to page ${pageIndex} - 切换到页面${pageIndex}`);
    this.currentPageIndex = pageIndex;
    
    if (pageIndex === 0) {
      // 回到Symbol页面，启动动效
      this.startAnimation();
    } else {
      // 切换到其他页面，停止动效
      this.stopAnimation();
    }
  }

  @Builder
  SymbolPage() {
    Column() {
      Text('Symbol页面')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 30 })
        .id('text_symbol_title_sr20241230845510_001')

      Text('测试页面切屏时symbol图标循环动效启停')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 40 })
        .textAlign(TextAlign.Center)
        .id('text_symbol_desc_sr20241230845510_001')

      // Symbol图标动效区域
      Column() {
        Text('Symbol循环动效展示')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 30 })
          .id('text_animation_title_sr20241230845510_001')

        // 多个Symbol图标展示循环动效
        Row() {
          // 旋转Symbol
          Column() {
            Text('🔄')
              .fontSize(60)
              .rotate({ angle: this.animationAngle })
              .animation({
                duration: 80,
                curve: Curve.Linear
              })
            
            Text('旋转循环')
              .fontSize(14)
              .margin({ top: 15 })
          }
          .margin({ right: 40 })

          // 缩放Symbol
          Column() {
            Text('💫')
              .fontSize(60)
              .scale({ x: this.animationScale, y: this.animationScale })
              .animation({
                duration: 80,
                curve: Curve.EaseInOut
              })
            
            Text('缩放循环')
              .fontSize(14)
              .margin({ top: 15 })
          }
          .margin({ right: 40 })

          // 透明度Symbol
          Column() {
            Text('✨')
              .fontSize(60)
              .opacity(this.animationOpacity)
              .animation({
                duration: 80,
                curve: Curve.EaseInOut
              })
            
            Text('透明度循环')
              .fontSize(14)
              .margin({ top: 15 })
          }
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('12.3%')

        // 组合动效Symbol
        Row() {
          Text('🌟')
            .fontSize(80)
            .rotate({ angle: this.animationAngle })
            .scale({ x: this.animationScale, y: this.animationScale })
            .opacity(this.animationOpacity)
            .animation({
              duration: 80,
              curve: Curve.EaseInOut
            })
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('9.84%')
        .margin({ top: 20 })
      }
      .width('90%')
      .padding(30)
      .backgroundColor('#E8F5E8')
      .borderRadius(20)
      .id('symbol_animation_area_sr20241230845510_001')

      // 动效状态显示
      Text(`循环动效状态: ${this.isAnimationRunning ? '运行中' : '已停止'}`)
        .fontSize(18)
        .fontColor(this.isAnimationRunning ? Color.Green : Color.Red)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 30 })
        .id('animation_status_sr20241230845510_001')

      Blank()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }

  @Builder
  OtherPage() {
    Column() {
      Text('其他页面')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 30 })
        .id('text_other_title_sr20241230845510_001')

      Text('这是用于测试切屏的其他页面')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 40 })
        .id('text_other_desc_sr20241230845510_001')

      // 其他页面内容
      Column() {
        Text('📱')
          .fontSize(80)
          .margin({ bottom: 20 })

        Text('当前在其他页面')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 20 })

        Text('Symbol页面的动效应该已停止')
          .fontSize(16)
          .fontColor(Color.Orange)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .padding(40)
      .backgroundColor('#FFF3E0')
      .borderRadius(20)
      .id('other_page_content_sr20241230845510_001')

      Blank()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }

  build() {
    Column() {
      // 页面切换导航
      Row() {
        Button('Symbol页面')
          .id('button_symbol_page_sr20241230845510_001')
          .fontSize(16)
          .width(120)
          .height(45)
          .backgroundColor(this.currentPageIndex === 0 ? Color.Blue : Color.Gray)
          .fontColor(Color.White)
          .margin({ right: 15 })
          .onClick(() => {
            this.switchPage(0);
          })

        Button('其他页面')
          .id('button_other_page_sr20241230845510_001')
          .fontSize(16)
          .width(120)
          .height(45)
          .backgroundColor(this.currentPageIndex === 1 ? Color.Blue : Color.Gray)
          .fontColor(Color.White)
          .onClick(() => {
            this.switchPage(1);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20, bottom: 20 })
      .id('page_navigation_sr20241230845510_001')

      // 页面内容区域
      if (this.currentPageIndex === 0) {
        this.SymbolPage()
      } else {
        this.OtherPage()
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16 })
  }
}
