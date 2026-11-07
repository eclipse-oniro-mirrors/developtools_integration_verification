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

import { PageOne0310Builder } from './pageOne0310';
import { PageThree0310Builder } from './pageThree0310';

@Builder
export function navigationB0310Builder(name: string, param: Object) {
  NavigationB0310()
}

@Builder
function dynamicBuilderB0310(name: string, param: Object) {
  if (name === 'PageOne0310') {
    PageOne0310Builder(name, param);
  } else if (name === 'PageThree0310') {
    PageThree0310Builder(name, param);
  }
}

@Component
export struct NavigationB0310 {
  private pathStackB: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Navigation(this.pathStackB) {
        Column() {
          Text('NavigationB')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('NavigationB push pageOne')
            .id('navigationBPushPageOneBtn0310')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackB.pushPath({ name: 'PageOne0310', param: null });
            });

          Button('NavigationB push pageThree')
            .id('navigationBPushPageThreeBtn0310')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackB.pushPath({ name: 'PageThree0310', param: null });
            });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#F5F5F5')
      }
      .title('NavigationB')
      .navDestination(dynamicBuilderB0310)
    }
    .title('NavigationB')
    .mode(NavDestinationMode.STANDARD)
  }
}
