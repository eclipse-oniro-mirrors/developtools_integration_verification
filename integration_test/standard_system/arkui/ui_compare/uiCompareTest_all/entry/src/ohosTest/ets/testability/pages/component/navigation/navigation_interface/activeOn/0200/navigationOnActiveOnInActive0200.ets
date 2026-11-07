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
 * NavigationOnActiveOnInActive0200
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，关闭动画，disableAnimation设置为true）
 */

import { BasicStackOperation0200Builder } from './basicStackOperation0200';
import { PageOne0200Builder } from './pageOne0200';
import { PageTwo0200Builder } from './pageTwo0200';
import { PageThree0200Builder } from './pageThree0200';

@Builder
function dynamicBuilder0200(name: string, param: Object) {
  if (name === 'BasicStackOperation0200') {
    BasicStackOperation0200Builder(name, param);
  } else if (name === 'PageOne0200') {
    PageOne0200Builder(name, param);
  } else if (name === 'PageTwo0200') {
    PageTwo0200Builder(name, param);
  } else if (name === 'PageThree0200') {
    PageThree0200Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0200 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation基础栈操作场景')
          .id('navigationBasicStackOperationBtn0200')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'BasicStackOperation0200', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0200)
  }
}

