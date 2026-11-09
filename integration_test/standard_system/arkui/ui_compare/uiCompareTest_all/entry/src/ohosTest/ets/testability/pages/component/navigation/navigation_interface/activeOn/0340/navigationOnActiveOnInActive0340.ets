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
 * NavigationOnActiveOnInActive0340
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（同一个页面存在两个navigation）
 */

import { NavigationA0340Builder } from './navigationA0340';
import { NavigationB0340Builder } from './navigationB0340';

// 全局变量：用于存储主 Navigation 的 pathStack 引用
let mainPathStack0340: NavPathStack | null = null;

export function getMainPathStack0340(): NavPathStack | null {
  return mainPathStack0340;
}

@Builder
function dynamicBuilder0340(name: string, param: Object) {
  if (name === 'NavigationA0340') {
    NavigationA0340Builder(name, param);
  } else if (name === 'NavigationB0340') {
    NavigationB0340Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0340 {
  private pathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    mainPathStack0340 = this.pathStack;
  }

  aboutToDisappear() {
    mainPathStack0340 = null;
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('navigation嵌套场景（并列）')
          .id('navigationParallelSceneBtn0340')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'NavigationA0340', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0340)
  }
}
