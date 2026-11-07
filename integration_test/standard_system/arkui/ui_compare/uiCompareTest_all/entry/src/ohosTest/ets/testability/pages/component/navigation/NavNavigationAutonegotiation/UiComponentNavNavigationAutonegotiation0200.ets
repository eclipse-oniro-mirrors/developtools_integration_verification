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
export struct UiComponentNavNavigationAutonegotiation0200 {
  build() {
    Column() {
      Navigation() {
        Column() {
          // 标题区域
          Text('测试用例 0200')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#1E88E5')
            .margin({ top: 20, bottom: 10 })
          
          Divider()
            .strokeWidth(2)
            .color('#E3F2FD')
            .margin({ bottom: 15 })
          
          // 测试信息卡片
          Column() {
            Text('📋 测试场景')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#424242')
              .width('100%')
              .margin({ bottom: 8 })
            
            Text('Stack模式不存在NavDestination')
              .fontSize(14)
              .fontColor('#757575')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('Navigation高度：auto（自适应）')
              .fontSize(14)
              .fontColor('#757575')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('NavDestination：无')
              .fontSize(14)
              .fontColor('#757575')
              .width('100%')
              .margin({ left: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .margin({ bottom: 15 })
          
          // 预期效果卡片
          Column() {
            Text('✅ 预期效果')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#2E7D32')
              .width('100%')
              .margin({ bottom: 8 })
            
            Text('Navigation自适应NavBar界面的内容高度')
              .fontSize(14)
              .fontColor('#388E3C')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('整体布局美观协调')
              .fontSize(14)
              .fontColor('#388E3C')
              .width('100%')
              .margin({ left: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#E8F5E9')
          .borderRadius(8)
          .margin({ bottom: 20 })
          
          // 说明文本
          Text('💡 此测试用例用于验证Stack模式下，当没有NavDestination时，Navigation组件能够正确地根据NavBar内容自适应高度。')
            .fontSize(13)
            .fontColor('#616161')
            .lineHeight(20)
            .width('90%')
            .padding(12)
            .backgroundColor('#FFF9C4')
            .borderRadius(6)
        }
        .width('100%')
        .padding({ left: 20, right: 20 })
      }
      .id('navigation_autonegotiation_0200')
      .mode(NavigationMode.Stack)
      .height('auto')
      .title('Stack模式-高度auto')
      .titleMode(NavigationTitleMode.Mini)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
