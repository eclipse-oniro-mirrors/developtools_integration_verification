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

import { promptAction } from '@kit.ArkUI';

@Builder
export function pageOne0620Builder(name: string, param: Object) {
  PageOne0620()
}

@Component
export struct PageOne0620 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('show dialog')
          .id('showDialogBtn0620')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            promptAction.showDialog({
              title: 'Dialog',
              message: 'This is a dialog',
              buttons: [
                {
                  text: 'OK',
                  color: '#000000'
                }
              ]
            });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F5F5F5')
    }
    .title('PageOne')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag PageOne0620 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageOne0620 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

