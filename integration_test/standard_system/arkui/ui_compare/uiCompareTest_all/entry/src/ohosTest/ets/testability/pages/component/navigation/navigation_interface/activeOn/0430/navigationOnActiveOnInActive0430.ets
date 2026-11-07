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
 * NavigationOnActiveOnInActive0430
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（锁屏解锁场景测试）
 */

import { BasicStackOperation0430Builder } from './basicStackOperation0430';
import { PageOne0430Builder } from './pageOne0430';
import { PageThree0430Builder } from './pageThree0430';

@Builder
function dynamicBuilder0430(name: string, param: Object) {
  if (name === 'BasicStackOperation0430') {
    BasicStackOperation0430Builder(name, param);
  } else if (name === 'PageOne0430') {
    PageOne0430Builder(name, param);
  } else if (name === 'PageThree0430') {
    PageThree0430Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0430 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('基础场景')
          .id('basicSceneBtn0430')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'BasicStackOperation0430', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0430)
  }
}

