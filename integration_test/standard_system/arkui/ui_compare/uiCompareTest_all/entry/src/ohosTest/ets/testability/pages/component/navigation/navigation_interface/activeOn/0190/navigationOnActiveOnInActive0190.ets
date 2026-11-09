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
 * NavigationOnActiveOnInActive0190
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，关闭动画，参数animated设置为false）
 */

import { BasicStackOperation0190Builder } from './basicStackOperation0190';
import { PageOne0190Builder } from './pageOne0190';
import { PageTwo0190Builder } from './pageTwo0190';
import { PageThree0190Builder } from './pageThree0190';

@Builder
function dynamicBuilder0190(name: string, param: Object) {
  if (name === 'BasicStackOperation0190') {
    BasicStackOperation0190Builder(name, param);
  } else if (name === 'PageOne0190') {
    PageOne0190Builder(name, param);
  } else if (name === 'PageTwo0190') {
    PageTwo0190Builder(name, param);
  } else if (name === 'PageThree0190') {
    PageThree0190Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0190 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('基础场景')
          .id('basicSceneBtn0190')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'BasicStackOperation0190', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0190)
  }
}

