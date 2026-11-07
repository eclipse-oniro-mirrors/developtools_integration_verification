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
export function basicStackOperation0240Builder(name: string, param: Object) {
  BasicStackOperation0240()
}

@Component
export struct BasicStackOperation0240 {
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('BasicStackOperation')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('push pageOne')
          .id('pushPageOneBtn0240')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageOne0240', param: null });
          });

        Button('push pageTwo')
          .id('pushPageTwoBtn0240')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageTwo0240', param: null });
          });

        Button('push pageThree')
          .id('pushPageThreeBtn0240')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageThree0240', param: null });
          });

        Button('push pageFour')
          .id('pushPageFourBtn0240')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'PageFour0240', param: null });
          });

        Button('move*3,pop*2')
          .id('move3Pop2Btn0240')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.moveIndexToTop(0);
            this.pathStack.moveIndexToTop(1);
            this.pathStack.moveIndexToTop(2);
            this.pathStack.pop();
            this.pathStack.pop();
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title('BasicStackOperation')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag BasicStackOperation0240 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag BasicStackOperation0240 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

