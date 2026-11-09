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
export function pageOne0110Builder(name: string, param: Object) {
  PageOne0110()
}

@Component
export struct PageOne0110 {
  pathStack: NavPathStack = new NavPathStack();
  @State counter: number = 0;
  private paramMsg: string = '';

  onNewParam(param: Object) {
    console.log(`testTag PageOne0110 onNewParam called with param: ${JSON.stringify(param)}`);
    if (param && typeof param === 'string') {
      this.paramMsg = param;
      console.log(`testTag PageOne0110 onNewParam successful, param: ${JSON.stringify(param)}`);
    }
  }

  aboutToAppear() {
    this.counter = 0;
  }

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Text(`Counter: ${this.counter}`)
          .fontSize(18)
          .margin({ bottom: 10 });

        if (this.paramMsg) {
          Text(`Param: ${this.paramMsg}`)
            .fontSize(16)
            .fontColor('#007DFF')
            .margin({ bottom: 10 });
        }
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F5F5F5')
    }
    .title('PageOne')
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

