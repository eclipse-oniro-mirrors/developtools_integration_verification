/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LengthMetrics, uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentScrollClipContent0070 {
  @State name: string = 'UIComponentScrollClipContent0070';
  @State message: string = 'UIComponentScrollClipContent0070';
  @State scrollSafeAreaPadding1: LocalizedPadding = {
    top: new LengthMetrics(0),
    bottom: new LengthMetrics(-20),
    end: undefined,
    // start: new LengthMetrics(null)
    start: new LengthMetrics(30)
  };
  @State scrollSafeAreaPadding2: LocalizedPadding = {
    top: new LengthMetrics(0),
    bottom: new LengthMetrics(-20),
    end: undefined,
    // start: new LengthMetrics(null)
    start: new LengthMetrics(1000)
  };
  @State scrollSafeAreaPadding: LocalizedPadding = this.scrollSafeAreaPadding1;
  private paddingFlag: number = 1;


  aboutToAppear(): void {
    this.message += `\n scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
  }

  build() {
    Column() {
      Column() {
        Text(this.message)
          .margin(10)
          .textAlign(TextAlign.Center)
        Button('Switch scrollSafeAreaPadding')
          .id(this.name + '_01')
          .onClick(() => {
            switch (this.paddingFlag) {
              case 1:
                this.scrollSafeAreaPadding = this.scrollSafeAreaPadding2;
                this.paddingFlag = 2;
                this.message += `\n scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
                break;
              case 2:
                this.scrollSafeAreaPadding = this.scrollSafeAreaPadding1;
                this.paddingFlag = 1;
                this.message += `\n scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
                break;
            }
          })
      }
      .width('100%')
      .height('20%')

      Scroll() {
        Column() {
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Yellow)
      }
      .friction(0.6)
      .backgroundColor(Color.Brown)
      .safeAreaPadding(this.scrollSafeAreaPadding)
      .width('100%')
      .height('80%')
    }
  }
}
