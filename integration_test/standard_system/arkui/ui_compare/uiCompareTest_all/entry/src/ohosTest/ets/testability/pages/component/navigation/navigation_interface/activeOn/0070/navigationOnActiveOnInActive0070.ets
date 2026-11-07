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
 * NavigationOnActiveOnInActive0070
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（栈操作replace接口，replace DIALOG页面）
 */

import { BasicStackOperation0070Builder } from './basicStackOperation0070';
import { PageTwo0070Builder } from './pageTwo0070';
import { PageThree0070Builder } from './pageThree0070';
import { PageFour0070Builder } from './pageFour0070';

@Builder
function dynamicBuilder0070(name: string, param: Object) {
  if (name === 'BasicStackOperation0070') {
    BasicStackOperation0070Builder(name, param);
  } else if (name === 'PageTwo0070') {
    PageTwo0070Builder(name, param);
  } else if (name === 'PageThree0070') {
    PageThree0070Builder(name, param);
  } else if (name === 'PageFour0070') {
    PageFour0070Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0070 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation基础栈操作场景')
          .id('navigationBasicStackOperationBtn0070')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'BasicStackOperation0070', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0070)
  }
}

