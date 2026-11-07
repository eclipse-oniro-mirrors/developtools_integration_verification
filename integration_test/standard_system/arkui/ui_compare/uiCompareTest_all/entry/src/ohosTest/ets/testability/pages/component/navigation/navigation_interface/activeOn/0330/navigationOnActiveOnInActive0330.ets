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
 * NavigationOnActiveOnInActive0330
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0330
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（Navigation嵌套操作，pushDestination+pushPath结合）
 */

import { TestStandard010330Builder } from './testStandard010330';
import { TestStandard020330Builder } from './testStandard020330';

@Builder
function dynamicBuilder0330(name: string, param: Object) {
  if (name === 'TestStandard010330') {
    TestStandard010330Builder(name, param);
  } else if (name === 'TestStandard020330') {
    TestStandard020330Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0330 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('navigation嵌套调用')
          .id('navigationNestedCallBtn0330')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushDestination({ name: 'TestStandard010330', param: null });
            this.pathStack.pushPath({ name: 'TestStandard020330', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0330)
  }
}

