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

import { NavigationScene0130Builder } from './navigationScene0130';
import { PageOne0130Builder } from './pageOne0130';
import { PageTwo0130Builder } from './pageTwo0130';

@Builder
function dynamicBuilder0130(name: string, param: Object) {
  if (name === 'NavigationScene0130') {
    NavigationScene0130Builder(name, param);
  } else if (name === 'PageOne0130') {
    PageOne0130Builder(name, param);
  } else if (name === 'PageTwo0130') {
    PageTwo0130Builder(name, param);
  }
}

@Entry
@Component
export struct NavigationOnNewParam0130 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('Navigation单例跳转支持参数刷新回调OnNewParam')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('Navigation组件场景')
          .id('navigationSceneBtn0130')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'NavigationScene0130', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('Navigation单例跳转支持参数刷新回调OnNewParam')
    .navDestination(dynamicBuilder0130)
  }
}

