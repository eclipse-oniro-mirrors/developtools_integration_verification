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
struct UIComponentScrollClipContent0030 {
  @State name: string = 'UIComponentScrollClipContent0030';
  @State message: string = 'UIComponentScrollClipContent0030';
  @State scrollSafeAreaPadding1: Padding = {
    top: 0,
    bottom: -20,
    left: undefined,
    right: '200%'
  };
  @State scrollSafeAreaPadding2: Padding = {
    top: 1000,
    bottom: -20,
    left: undefined,
    // right: null
    right: 0
  };
  @State scrollSafeAreaPadding: Padding = this.scrollSafeAreaPadding1;
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
