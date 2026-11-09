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
 * NavigationOnActiveOnInActive0160
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（栈操作remove STANDARD、DIALOG页面）
 */

import { BasicStackOperation0160Builder } from './basicStackOperation0160';
import { PageOne0160Builder } from './pageOne0160';
import { PageTwo0160Builder } from './pageTwo0160';
import { PageThree0160Builder } from './pageThree0160';
import { PageFour0160Builder } from './pageFour0160';

@Builder
function dynamicBuilder0160(name: string, param: Object) {
  if (name === 'BasicStackOperation0160') {
    BasicStackOperation0160Builder(name, param);
  } else if (name === 'PageOne0160') {
    PageOne0160Builder(name, param);
  } else if (name === 'PageTwo0160') {
    PageTwo0160Builder(name, param);
  } else if (name === 'PageThree0160') {
    PageThree0160Builder(name, param);
  } else if (name === 'PageFour0160') {
    PageFour0160Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0160 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation基础栈操作场景')
          .id('navigationBasicStackOperationBtn0160')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'BasicStackOperation0160', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0160)
  }
}

