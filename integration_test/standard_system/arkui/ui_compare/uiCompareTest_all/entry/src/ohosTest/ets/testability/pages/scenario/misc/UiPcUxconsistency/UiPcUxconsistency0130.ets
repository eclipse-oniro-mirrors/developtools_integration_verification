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
struct UiPcUxconsistency0130 {
  build() {
    Column() {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Text('测试用例: SUB_ACE_UI_PC_UXCONSISTENCY_0130')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('测试目标: 侧边栏设置 SideBarPosition.Start 失焦灰显测试')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ bottom: 10 })

          Text('配置说明: SideBarPosition 设置为 Start，showSideBar 为 true')
            .fontSize(12)
            .fontColor('#888888')
            .margin({ bottom: 15 })
          
          Text('侧边栏内容区域')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('位置: Start (左侧)')
            .fontSize(14)
            .margin({ bottom: 5 })
          
          Text('类型: Embed')
            .fontSize(14)
            .margin({ bottom: 5 })
          
          Text('状态: 显示')
            .fontSize(14)
            .margin({ bottom: 10 })
          
          Text('预期效果: 侧边栏所在区域出现半透明灰色蒙层')
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
            .margin({ bottom: 10 })
          
          Text('侧边栏在左侧显示')
            .fontSize(14)
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')

        .justifyContent(FlexAlign.Center)
      }
      .id('sidebarcontainer_uxconsistency_0130')
      .showSideBar(true)
      .sideBarPosition(SideBarPosition.Start)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}

