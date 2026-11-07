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

import { NavigationScene0110Builder } from './navigationScene0110';
import { PageOne0110Builder } from './pageOne0110';
import { PageTwo0110Builder } from './pageTwo0110';

@Builder
function dynamicBuilder0110(name: string, param: Object) {
  if (name === 'NavigationScene0110') {
    NavigationScene0110Builder(name, param);
  } else if (name === 'PageOne0110') {
    PageOne0110Builder(name, param);
  } else if (name === 'PageTwo0110') {
    PageTwo0110Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnNewParam0110 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation单例跳转支持参数刷新回调OnNewParam')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation组件场景')
          .id('navigationSceneBtn0110')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'NavigationScene0110', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation单例跳转支持参数刷新回调OnNewParam')
    .navDestination(dynamicBuilder0110)
  }
}

