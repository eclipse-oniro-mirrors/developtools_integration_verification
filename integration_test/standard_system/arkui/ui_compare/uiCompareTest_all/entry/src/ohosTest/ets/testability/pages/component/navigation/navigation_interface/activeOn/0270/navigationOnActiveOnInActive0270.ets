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
 * NavigationOnActiveOnInActive0270
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0270
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用replace+moveToTop）
 */

import { PageOne0270Builder } from './pageOne0270';
import { PageThree0270Builder } from './pageThree0270';

@Builder
function dynamicBuilder0270(name: string, param: Object) {
  if (name === 'PageOne0270') {
    PageOne0270Builder(name, param);
  } else if (name === 'PageThree0270') {
    PageThree0270Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0270 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation组合场景')
          .id('navigationCombinedSceneBtn0270')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.replacePath({ name: 'PageThree0270', param: null });
            this.pathStack.moveIndexToTop(0);
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0270)
  }
}

