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

import { PageOne0480Builder } from './pageOne0480';

@Builder
export function navigationRouterCombinedScene0480Builder(name: string, param: Object) {
  NavigationRouterCombinedScene0480()
}

@Component
export struct NavigationRouterCombinedScene0480 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('NavigationRouterCombinedScene')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('push pageOne')
          .id('pushPageOneBtn0480')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageOne0480', param: null });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('NavigationRouterCombinedScene')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag NavigationRouterCombinedScene0480 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag NavigationRouterCombinedScene0480 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

