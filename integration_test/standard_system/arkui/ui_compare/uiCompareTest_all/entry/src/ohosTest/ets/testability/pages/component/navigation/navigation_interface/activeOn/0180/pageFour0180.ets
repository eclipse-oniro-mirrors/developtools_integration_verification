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
export function pageFour0180Builder(name: string, param: Object) {
  PageFour0180()
}

@Component
export struct PageFour0180 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('PageFour')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#C5C5C5')
    }
    .title('PageFour')
    .mode(NavDestinationMode.DIALOG)
    .onActive((reason: number) => {
      console.log(`testTag PageFour0180 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageFour0180 onInActive reason: ${reason}`);
    })
    .onBackPressed(() => {
      console.log(`testTag PageFour0180 onBackPressed`);
      return false;
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

