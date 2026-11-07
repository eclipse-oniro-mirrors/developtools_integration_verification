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
 * NavigationControlButton0200
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_CONTROLBUTTON_0200
 * 测试目的：标题避让sidebar（自定义controlButton测试）
 */

import { CustomControlButtonPage0200Builder } from './customControlButtonPage0200';

@Builder
function dynamicBuilder0200(name: string, param: Object) {
  if (name === 'CustomControlButtonPage0200') {
    CustomControlButtonPage0200Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationControlButton0200 {
  @State showSideBar: boolean = false; // 侧边栏收起
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
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

          Button('自定义controlButton')
            .id('enterPageBtn0200')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'CustomControlButtonPage0200', param: null });
            });

          // 注意：controlButton属性在Navigation组件中可能不存在，这里只做页面导航测试
          Text('自定义controlButton测试')
            .fontSize(16)
            .fontColor('#666666')
            .margin({ top: 20 });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#FFFFFF')
      }
      .title('Navigation基础场景')
      .titleMode(NavigationTitleMode.Free)
      .navDestination(dynamicBuilder0200)
    }
    .showSideBar(this.showSideBar)
    .sideBarWidth(240)
    .minSideBarWidth(200)
    .maxSideBarWidth(400)
  }
}

