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
 * NavigationOnActiveOnInActive0360
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（路由栈派生类场景测试）
 */

import { PageOne0360Builder } from './pageOne0360';
import { PageThree0360Builder } from './pageThree0360';

@Builder
function dynamicBuilder0360(name: string, param: Object) {
  if (name === 'PageOne0360') {
    PageOne0360Builder(name, param);
  } else if (name === 'PageThree0360') {
    PageThree0360Builder(name, param);
  }
}

class DerivedNavPathStack extends NavPathStack {
  pushPageOne() {
    this.pushPath({ name: 'PageOne0360', param: null });
  }

  pushPageThree() {
    this.pushPath({ name: 'PageThree0360', param: null });
  }

  popPage() {
    this.pop();
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0360 {
  private pathStack: DerivedNavPathStack = new DerivedNavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('路由栈派生类场景(Derived)')
          .id('derivedNavPathStackSceneBtn0360')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPageOne();
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0360)
  }
}

