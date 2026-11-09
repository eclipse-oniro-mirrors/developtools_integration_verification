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
struct UiPcUxconsistency0110 {
  build() {
    Column() {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Text('测试用例: SUB_ACE_UI_PC_UXCONSISTENCY_0110')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('测试目标: 侧边栏设置 showSideBar (true) 失焦灰显测试')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ bottom: 10 })

          Text('配置说明: showSideBar 设置为 true，类型为 Embed')
            .fontSize(12)
            .fontColor('#888888')
            .margin({ bottom: 15 })
          
          Text('当前配置:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('✓ showSideBar: true')
            .fontSize(13)
            .margin({ bottom: 5 })
          
          Text('✓ SideBarContainerType: Embed')
            .fontSize(13)
            .margin({ bottom: 5 })
          
          Text('✓ 侧边栏: 显示状态')
            .fontSize(13)
            .margin({ bottom: 10 })
          
          Text('侧边栏内容区域')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 10 })
          
          Text('预期效果: 页面无侧边栏显示，且不出现半透明灰色蒙层')
            .fontSize(12)
            .fontColor('#999999')
            .margin({ top: 15 })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .padding(20)

        Column() {
          Text('主内容区域')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('这里是主要内容显示区域')
            .fontSize(16)
            .fontColor('#666666')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .id('sidebarcontainer_uxconsistency_0110')
      .showSideBar(true)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}

