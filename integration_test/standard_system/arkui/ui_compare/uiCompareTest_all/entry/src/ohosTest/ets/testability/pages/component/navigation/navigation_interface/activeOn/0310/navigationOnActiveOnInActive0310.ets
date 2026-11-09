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
 * NavigationOnActiveOnInActive0310
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（Navigation嵌套场景）
 */

import { NavigationB0310Builder } from './navigationB0310';
import { NavigationA0310Builder } from './navigationA0310';

// 全局变量：用于存储主 Navigation 的 pathStack 引用
// 这样内层 Navigation 的页面可以访问主 Navigation 的 pathStack
let mainPathStack0310: NavPathStack | null = null;

export function getMainPathStack0310(): NavPathStack | null {
  return mainPathStack0310;
}

@Builder
function dynamicBuilder0310(name: string, param: Object) {
  if (name === 'NavigationB0310') {
    NavigationB0310Builder(name, param);
  } else if (name === 'NavigationA0310') {
    NavigationA0310Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0310 {
  private pathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    // 在组件出现时，将 pathStack 存储到全局变量
    mainPathStack0310 = this.pathStack;
  }

  aboutToDisappear() {
    // 在组件消失时，清理全局变量
    mainPathStack0310 = null;
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('navigation嵌套场景（嵌套）')
          .id('navigationNestedSceneBtn0310')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'NavigationB0310', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0310)
  }
}
