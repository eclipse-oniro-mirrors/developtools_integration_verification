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

import { PageOne0340Builder } from './pageOne0340';
import { PageThree0340Builder } from './pageThree0340';

@Builder
export function navigationA0340Builder(name: string, param: Object) {
  NavigationA0340()
}

@Builder
function dynamicBuilderA0340(name: string, param: Object) {
  if (name === 'PageOne0340') {
    PageOne0340Builder(name, param);
  } else if (name === 'PageThree0340') {
    PageThree0340Builder(name, param);
  }
}

@Component
export struct NavigationA0340 {
  private pathStackA: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Navigation(this.pathStackA) {
        Column() {
          Text('NavigationA')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('NavigationA push pageOne')
            .id('navigationAPushPageOneBtn0340')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackA.pushPath({ name: 'PageOne0340', param: null });
            });

          Button('NavigationA push pageThree')
            .id('navigationAPushPageThreeBtn0340')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackA.pushPath({ name: 'PageThree0340', param: null });
            });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#F5F5F5')
      }
      .title('NavigationA')
      .navDestination(dynamicBuilderA0340)
    }
    .title('NavigationA')
    .mode(NavDestinationMode.STANDARD)
  }
}

