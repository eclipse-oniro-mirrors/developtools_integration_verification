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

@Builder
export function pageOne0230Builder(name: string, param: Object) {
  PageOne0230()
}

@Component
export struct PageOne0230 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('pop*3')
          .id('pop3Btn0230')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pop();
            this.pathStack.pop();
            this.pathStack.pop();
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
      console.log(`testTag PageOne0230 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageOne0230 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

