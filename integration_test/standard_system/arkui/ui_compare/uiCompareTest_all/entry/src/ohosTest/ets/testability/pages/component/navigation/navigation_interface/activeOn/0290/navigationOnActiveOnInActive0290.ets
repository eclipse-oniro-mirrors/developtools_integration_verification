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
 * NavigationOnActiveOnInActive0290
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0290
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（aboutToAppear进行栈操作，push接口测试）
 */

import { PageEight0290Builder } from './pageEight0290';
import { TestStandard010290Builder } from './testStandard010290';

@Builder
function dynamicBuilder0290(name: string, param: Object) {
  if (name === 'PageEight0290') {
    PageEight0290Builder(name, param);
  } else if (name === 'TestStandard010290') {
    TestStandard010290Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0290 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation组件通过aboutToAppear进行栈操作')
          .id('navigationAboutToAppearOperationBtn0290')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageEight0290', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0290)
  }
}

