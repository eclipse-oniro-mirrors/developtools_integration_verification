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
struct UiPcUxconsistency0150 {
  @State showSideBar: boolean = false;
  @State statusMessage: string = '侧边栏当前状态: 隐藏';

  build() {
    Column() {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Text('测试用例: SUB_ACE_UI_PC_UXCONSISTENCY_0150')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('测试目标: 动态切换 showSideBar 属性失焦灰显测试')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ bottom: 10 })

          Text('测试步骤: 点击按钮切换侧边栏显示状态，观察失焦灰显效果')
            .fontSize(12)
            .fontColor('#888888')
            .margin({ bottom: 15 })
          
          Text('侧边栏内容区域')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('SideBarContainerType: Embed')
            .fontSize(14)
            .margin({ bottom: 5 })
          
          Text('showSideBar: ' + this.showSideBar)
            .fontSize(14)
            .margin({ bottom: 5 })
          
          Text(this.statusMessage)
            .fontSize(14)
            .fontColor('#007DFF')
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('预期效果: showSideBar 为显示状态时，页面出现半透明灰色蒙层')
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
          
          Button('切换侧边栏显示')
            .id('button_uxconsistency_0150')
            .onClick(() => {
              this.showSideBar = !this.showSideBar;
              this.statusMessage = '侧边栏当前状态: ' + (this.showSideBar ? '显示' : '隐藏');
            })
            .margin({ bottom: 15 })
            .width('60%')
            .backgroundColor('#007DFF')
          
          Text('这里是主要内容显示区域')
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
      .id('sidebarcontainer_uxconsistency_0150')
      .showSideBar(this.showSideBar)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}

