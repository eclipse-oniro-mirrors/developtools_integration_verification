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
 * NavigationOnActiveOnInActive0210
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210
 * 测试目的：NavDestination新增OnActive和OnInActive生命周期（自定义动画场景）
 */

import { BasicStackOperation0210Builder } from './basicStackOperation0210';
import { PageFive0210Builder } from './pageFive0210';
import { PageSix0210Builder } from './pageSix0210';

@Builder
function dynamicBuilder0210(name: string, param: Object) {
  if (name === 'BasicStackOperation0210') {
    BasicStackOperation0210Builder(name, param);
  } else if (name === 'PageFive0210') {
    PageFive0210Builder(name, param);
  } else if (name === 'PageSix0210') {
    PageSix0210Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnActiveOnInActive0210 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation基础场景')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('基础场景')
          .id('basicSceneBtn0210')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'BasicStackOperation0210', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation基础场景')
    .navDestination(dynamicBuilder0210)
  }
}

