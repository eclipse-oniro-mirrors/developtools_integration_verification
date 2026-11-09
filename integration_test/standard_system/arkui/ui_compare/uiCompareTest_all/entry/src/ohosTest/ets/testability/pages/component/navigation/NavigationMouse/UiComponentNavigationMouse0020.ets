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
export struct UiComponentNavigationMouse0020 {
  @State isSplit: boolean = true

  build() {
    Column() {
      // 说明区域
      Column() {
        Text('测试说明：Navigation 场景单双栏切换')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        
        Text('测试目的：')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FF6B35')
          .margin({ bottom: 3 })
        Text('验证Navigation组件在单双栏模式切换时，鼠标样式的正确响应行为')
          .fontSize(13)
          .fontColor('#666666')
          .margin({ left: 10, bottom: 8 })
        
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FF6B35')
          .margin({ bottom: 3 })
        Text('1. 点击"切换双栏"按钮')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('2. 鼠标放置分割线上，样式应变更')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('3. 点击"切换单栏"按钮')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('4. 鼠标样式应恢复')
          .fontSize(14)
          .margin({ left: 10, bottom: 8 })
        
        Text('预期结果：')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FF6B35')
          .margin({ bottom: 3 })
        Text('双栏模式下，鼠标悬停分割线时样式变为拖动样式；单栏模式下无分割线，鼠标样式恢复正常')
          .fontSize(13)
          .fontColor('#666666')
          .margin({ left: 10, bottom: 3 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .alignItems(HorizontalAlign.Start)

      // 控制按钮
      Row() {
        Button('切换单栏')
          .id('btn_single_column_0020')
          .onClick(() => {
            this.isSplit = false
          })
          .margin({ right: 10 })

        Button('切换双栏')
          .id('btn_split_column_0020')
          .onClick(() => {
            this.isSplit = true
          })
      }
      .margin({ top: 10, bottom: 10 })

      // Navigation 组件
      Navigation() {
        Column() {
          Text('内容区域')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .id('navigation_mouse_0020')
      .title('Navigation 场景单双栏切换')
      .mode(this.isSplit ? NavigationMode.Split : NavigationMode.Stack)
      .navBarPosition(NavBarPosition.Start)
      .navBarWidth(240)
      .navBarWidthRange([0, 1000])
      .minContentWidth(0)
      .width('100%')
      .height('40.98%')
      .border({ width: 1, color: Color.Gray })
    }
    .width('100%')
    .height('100%')
  }
}

