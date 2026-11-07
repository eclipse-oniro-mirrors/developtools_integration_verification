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
export function pageTwo0160Builder(name: string, param: Object) {
  PageTwo0160()
}

@Component
export struct PageTwo0160 {
  pathStack: NavPathStack = new NavPathStack();
  @State counter: number = 0;
  private paramMsg: string = '';

  onNewParam(param: Object) {
    console.log(`testTag PageTwo0160 onNewParam called with param: ${JSON.stringify(param)}`);
    if (param && typeof param === 'string') {
      this.paramMsg = param;
      console.log(`testTag PageTwo0160 onNewParam successful, param: ${JSON.stringify(param)}`);
    }
  }

  aboutToAppear() {
    this.counter = 1;
  }

  build() {
    NavDestination() {
      Column() {
        Text('PageTwo')
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
      .backgroundColor('#E8F5E9')
    }
    .title('PageTwo')
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

