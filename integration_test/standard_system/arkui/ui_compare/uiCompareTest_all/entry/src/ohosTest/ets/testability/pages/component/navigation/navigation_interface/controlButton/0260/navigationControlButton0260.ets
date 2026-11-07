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

/**
 * NavigationControlButton0260
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0260
 * 测试目的：标题避让sidebar（SideBarContainerType属性测试）
 */

import { NavigationCommonTitleNonCustomMenuPage0080Builder } from '../0080/navigationCommonTitleNonCustomMenuPage0080';

@Builder
function dynamicBuilder0260(name: string, param: Object) {
  if (name === 'NavigationCommonTitleNonCustomMenuPage0080') {
    NavigationCommonTitleNonCustomMenuPage0080Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationControlButton0260 {
  @State showSideBar: boolean = false; // 侧边栏收起
  @State sideBarContainerType: SideBarContainerType = SideBarContainerType.Embed;
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    SideBarContainer(this.sideBarContainerType) {
      // 侧边栏内容
      Column() {
        Text('Sidebar')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F5F5F5')

      // 内容区：Navigation
      Navigation(this.pathStack) {
        Column() {
          Text('Navigation基础场景')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('11 标题内容是NavigationCommonTitle类型-非自定义菜单')
            .id('enterPageBtn0260')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'NavigationCommonTitleNonCustomMenuPage0080', param: null });
            });

          Button('SideBarContainerType: Embed')
            .id('sideBarContainerTypeEmbedBtn0260')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.sideBarContainerType = SideBarContainerType.Embed;
            });

          Button('SideBarContainerType: Overlay')
            .id('sideBarContainerTypeOverlayBtn0260')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.sideBarContainerType = SideBarContainerType.Overlay;
            });

          Button('展开侧边栏')
            .id('showSideBarBtn0260')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showSideBar = true;
            });

          Button('收起侧边栏')
            .id('hideSideBarBtn0260')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showSideBar = false;
            });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#FFFFFF')
      }
      .title('Navigation基础场景')
      .titleMode(NavigationTitleMode.Free)
      .navDestination(dynamicBuilder0260)
    }
    .showSideBar(this.showSideBar)
    .sideBarWidth(240)
    .minSideBarWidth(200)
    .maxSideBarWidth(400)
  }
}

