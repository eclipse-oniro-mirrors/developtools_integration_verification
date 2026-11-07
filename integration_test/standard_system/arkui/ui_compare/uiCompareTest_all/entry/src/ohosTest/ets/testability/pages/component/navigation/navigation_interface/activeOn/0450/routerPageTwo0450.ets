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

import { PageThree0450Builder } from './pageThree0450';

@Builder
function dynamicBuilderRouterPageTwo0450(name: string, param: Object) {
  if (name === 'PageThree0450') {
    PageThree0450Builder(name, param);
  }
}

@Entry({ routeName: 'RouterPageTwo0450' })
@Component
export struct RouterPageTwo0450 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Text('RouterPageTwo')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Navigation(this.pathStack) {
        Column() {
          Button('navigationA push pageThree')
            .id('navigationAPushPageThreeBtn0450')
            .width(300)
            .height(50)
            .margin({ bottom: 10 })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'PageThree0450', param: null });
            });
        }
        .width('100%')
        .height('100%')
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#E3F2FD')
      }
      .title('NavigationA')
      .navDestination(dynamicBuilderRouterPageTwo0450)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFF3E0')
  }
}

