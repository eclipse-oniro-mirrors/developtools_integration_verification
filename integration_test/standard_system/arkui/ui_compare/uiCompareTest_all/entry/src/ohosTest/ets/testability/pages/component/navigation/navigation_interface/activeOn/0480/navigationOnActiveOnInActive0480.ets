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
 * NavigationOnActiveOnInActive0480
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（router组件场景，back场景验证）
 */

import { NavigationRouterCombinedScene0480Builder } from './navigationRouterCombinedScene0480';
import { PageOne0480Builder } from './pageOne0480';
import { PageThree0480Builder } from './pageThree0480';

@Builder
function dynamicBuilder0480(name: string, param: Object) {
  if (name === 'NavigationRouterCombinedScene0480') {
    NavigationRouterCombinedScene0480Builder(name, param);
  } else if (name === 'PageOne0480') {
    PageOne0480Builder(name, param);
  } else if (name === 'PageThree0480') {
    PageThree0480Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0480 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation与Router结合场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('navigation与router结合基础场景')
          .id('navigationRouterCombinedSceneBtn0480')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'NavigationRouterCombinedScene0480', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation与Router结合场景')
    .navDestination(dynamicBuilder0480)
  }
}

