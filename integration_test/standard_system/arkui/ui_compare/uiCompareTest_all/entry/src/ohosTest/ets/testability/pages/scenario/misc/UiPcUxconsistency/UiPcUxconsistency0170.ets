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
struct UiPcUxconsistency0170 {
  @State containerType: SideBarContainerType = SideBarContainerType.Embed;
  @State typeMessage: string = '当前类型: Embed (嵌入式)';

  build() {
    Column() {
      SideBarContainer(this.containerType) {
        Column() {
          Text('测试用例: SUB_ACE_UI_PC_UXCONSISTENCY_0170')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('测试目标: 动态切换 SideBarContainerType 失焦灰显测试')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ bottom: 10 })

          Text('测试步骤: 点击按钮在 Embed 和 Overlay 两种类型间切换')
            .fontSize(12)
            .fontColor('#888888')
            .margin({ bottom: 15 })
          
          Text(this.typeMessage)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .margin({ bottom: 10 })
          
          Text('Embed: 侧边栏嵌入内容，压缩主区域')
            .fontSize(12)
            .margin({ bottom: 5 })
          
          Text('Overlay: 侧边栏覆盖内容，不压缩主区域')
            .fontSize(12)
            .margin({ bottom: 15 })
          
          Text('侧边栏内容区域')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('类型: ' + (this.containerType === SideBarContainerType.Embed ? 'Embed' : 'Overlay'))
            .fontSize(14)
            .margin({ bottom: 5 })
          
          Text('可动态切换')
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
            .margin({ bottom: 20 })
          
          Button('切换容器类型')
            .id('button_uxconsistency_0170')
            .onClick(() => {
              this.containerType = this.containerType === SideBarContainerType.Embed ?
                SideBarContainerType.Overlay : SideBarContainerType.Embed;
              this.typeMessage = '当前类型: ' + 
                (this.containerType === SideBarContainerType.Embed ? 'Embed (嵌入式)' : 'Overlay (覆盖式)');
            })
            .margin({ bottom: 15 })
            .width('60%')
            .backgroundColor('#4CAF50')
          
          Text('观察切换时的布局变化')
            .fontSize(16)
            .fontColor('#666666')
            .margin({ bottom: 10 })
          
          Text('点击按钮测试动态切换功能')
            .fontSize(14)
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .id('sidebarcontainer_uxconsistency_0170')
      .showSideBar(true)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}

