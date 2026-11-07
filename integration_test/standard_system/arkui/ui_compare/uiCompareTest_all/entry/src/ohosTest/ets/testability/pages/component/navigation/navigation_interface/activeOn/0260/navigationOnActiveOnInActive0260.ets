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
 * NavigationOnActiveOnInActive0260
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0260
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用push+pushDestination）
 */

import { PageOne0260Builder } from './pageOne0260';
import { PageTwo0260Builder } from './pageTwo0260';

@Builder
function dynamicBuilder0260(name: string, param: Object) {
  if (name === 'PageOne0260') {
    PageOne0260Builder(name, param);
  } else if (name === 'PageTwo0260') {
    PageTwo0260Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0260 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation组合场景')
          .id('navigationCombinedSceneBtn0260')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageOne0260', param: null });
            this.pathStack.pushDestination({ name: 'PageTwo0260', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0260)
  }
}

