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
export struct UiComponentNavigationMouse0090 {

  build() {
    Column() {
      // 说明区域
      Column() {
        Text('测试说明：SideBarContainer 场景拖动停止')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        
        Text('测试目的：')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FF6B35')
          .margin({ bottom: 3 })
        Text('验证SideBarContainer组件分割线拖动操作停止后，鼠标样式根据位置正确恢复或保持')
          .fontSize(13)
          .fontColor('#666666')
          .margin({ left: 10, bottom: 8 })
        
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FF6B35')
          .margin({ bottom: 3 })
        Text('1. 鼠标放置分割线上，样式应变更')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('2. 长按鼠标拖拽分割线')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('3. 拖动过程中鼠标样式不变')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('4. 松开鼠标左键')
          .fontSize(14)
          .margin({ left: 10, bottom: 3 })
        Text('5. 鼠标在分割线上则样式不变，否则恢复')
          .fontSize(14)
          .margin({ left: 10, bottom: 8 })
        
        Text('预期结果：')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FF6B35')
          .margin({ bottom: 3 })
        Text('拖动停止后，若鼠标仍在侧边栏分割线热区内，样式保持拖动样式；若鼠标离开热区，样式恢复为正常指针')
          .fontSize(13)
          .fontColor('#666666')
          .margin({ left: 10, bottom: 3 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .alignItems(HorizontalAlign.Start)

      // SideBarContainer 组件
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Text('侧边栏内容')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#E8F5E9')

        Column() {
          Text('主内容区域')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#E3F2FD')
      }
      .id('sidebar_container_mouse_0090')
      .sideBarWidth(200)
      .minSideBarWidth(150)
      .maxSideBarWidth(300)
      .showSideBar(true)
      .divider(null)
      .onChange((value: boolean) => {
        console.info('SideBar status changed: ' + value)
      })
      .width('100%')
      .height('40.98%')
      .border({ width: 1, color: Color.Gray })
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
  }
}

