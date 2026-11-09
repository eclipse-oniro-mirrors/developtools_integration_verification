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
struct MenuPlacement14 {
  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '🔍 搜索功能' })
      MenuItem({ content: '📊 数据分析' })
      MenuItem({ content: '💾 保存数据' })
      MenuItem({ content: '📤 导出文件' })
    }
    .backgroundColor(0xFFFFFF)
    .borderRadius(8)
    .shadow({
      radius: 12,
      color: 0x1A000000,
      offsetX: 0,
      offsetY: 4
    })
  }

  @Builder
  InfoCard() {
    Column() {
      Text('🎯 菜单定位测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(0x333333)
        .margin({ bottom: 8 })
      
      Text('Bottom 定位')
        .fontSize(16)
        .fontColor(0x666666)
        .margin({ bottom: 16 })
      
      Text('• 菜单宽度: 自适应')
        .fontSize(14)
        .fontColor(0x888888)
        .margin({ bottom: 4 })
      
      Text('• 触发方式: 右击')
        .fontSize(14)
        .fontColor(0x888888)
        .margin({ bottom: 4 })
      
      Text('• 定位方向: 底部')
        .fontSize(14)
        .fontColor(0x888888)
    }
    .padding(20)
    .backgroundColor(0xFFFFFF)
    .borderRadius(16)
    .shadow({
      radius: 8,
      color: 0x1A000000,
      offsetX: 0,
      offsetY: 2
    })
    .margin({ bottom: 30 })
  }

  build() {
    Stack() {
      // 渐变背景
      Column()
        .width('100%')
        .height('100%')
        .linearGradient({
          direction: GradientDirection.Bottom,
          colors: [[0xFFE67E22, 0.0], [0xFFD35400, 0.3], [0xFFE74C3C, 0.7], [0xFFC0392B, 1.0]]
        })
      
      // 装饰性圆形
      Circle()
        .width(100)
        .height(100)
        .fill(0x20FFFFFF)
        .position({ x: '25%', y: '20%' })
      
      Circle()
        .width(140)
        .height(140)
        .fill(0x15FFFFFF)
        .position({ x: '75%', y: '60%' })
      
      // 主要内容
      Row() {
        Column() {
          this.InfoCard()
          
          Button('🎮 测试菜单')
            .id('button_14')
            .width(120)
            .height(50)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .backgroundColor(0xE67E22)
            .fontColor(0xFFFFFF)
            .borderRadius(25)
            .shadow({
              radius: 8,
              color: 0x2AE67E22,
              offsetX: 0,
              offsetY: 4
            })
            .bindContextMenu(this.MyMenu, ResponseType.RightClick, {
              placement: Placement.Bottom
            })
            .onClick(() => {
              console.info('MenuPlacement14: 按钮被点击');
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.End)
      .alignItems(VerticalAlign.Center)
      .padding({ right: 20, bottom: 50 })
    }
    .width('100%')
    .height('100%')
  }
}
