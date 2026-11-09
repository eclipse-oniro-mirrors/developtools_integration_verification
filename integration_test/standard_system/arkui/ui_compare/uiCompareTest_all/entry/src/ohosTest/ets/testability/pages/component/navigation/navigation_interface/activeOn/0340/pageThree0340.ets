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

import { getMainPathStack0340 } from './navigationOnActiveOnInActive0340';

// 定义参数类型
interface NavParam0340 {
  autoPushPageTwo?: boolean;
}

@Builder
export function pageThree0340Builder(name: string, param: Object) {
  PageThree0340()
}

@Component
export struct PageThree0340 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('PageThree')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('NavigationB push pageTwo')
          .id('navigationBPushPageTwoBtn0340')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            // PageThree is in NavigationA, but needs to push NavigationB to main Navigation
            // Then NavigationB will automatically push PageTwo0340
            const mainPathStack = getMainPathStack0340();
            if (mainPathStack) {
              // Push NavigationB0340 to main Navigation with a flag to auto-push PageTwo0340
              const navParam: NavParam0340 = { autoPushPageTwo: true };
              mainPathStack.pushPath({ name: 'NavigationB0340', param: navParam });
            } else {
              console.error('Main pathStack not available in PageThree0340');
            }
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#D5D5D5')
    }
    .title('PageThree')
    .mode(NavDestinationMode.DIALOG)
    .onActive((reason: number) => {
      console.log(`testTag pageThree onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag pageThree onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}
