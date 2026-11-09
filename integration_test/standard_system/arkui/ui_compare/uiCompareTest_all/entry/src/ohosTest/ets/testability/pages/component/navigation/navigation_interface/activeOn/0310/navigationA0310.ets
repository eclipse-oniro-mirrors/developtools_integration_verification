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

import { PageTwo0310Builder } from './pageTwo0310';

@Builder
export function navigationA0310Builder(name: string, param: Object) {
  NavigationA0310()
}

@Builder
function dynamicBuilderA0310(name: string, param: Object) {
  if (name === 'PageTwo0310') {
    PageTwo0310Builder(name, param);
  }
}

@Component
export struct NavigationA0310 {
  private pathStackA: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Navigation(this.pathStackA) {
        Column() {
          Text('NavigationA')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 });

          Button('NavigationA push pageTwo')
            .id('navigationAPushPageTwoBtn0310')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackA.pushPath({ name: 'PageTwo0310', param: null });
            });

          Button('pop')
            .id('popBtn0310')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStackA.pop();
            });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#E5E5E5')
      }
      .title('NavigationA')
      .navDestination(dynamicBuilderA0310)
    }
    .title('NavigationA')
    .mode(NavDestinationMode.STANDARD)
  }
}

