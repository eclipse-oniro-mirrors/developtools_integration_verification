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
export function pageTwo0410Builder(name: string, param: Object) {
  PageTwo0410()
}

@Component
export struct PageTwo0410 {
  pathStack: NavPathStack = new NavPathStack();
  @State visibilityState: Visibility = Visibility.Visible;

  build() {
    NavDestination() {
      Column() {
        Text('PageTwo')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button(`visibility：${this.visibilityState}`)
          .id('visibilityBtn0410')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            if (this.visibilityState === Visibility.Visible) {
              this.visibilityState = Visibility.Hidden;
            } else if (this.visibilityState === Visibility.Hidden) {
              this.visibilityState = Visibility.None;
            } else {
              this.visibilityState = Visibility.Visible;
            }
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E5E5E5')
      .visibility(this.visibilityState)
    }
    .title('PageTwo')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag PageTwo0410 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageTwo0410 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

