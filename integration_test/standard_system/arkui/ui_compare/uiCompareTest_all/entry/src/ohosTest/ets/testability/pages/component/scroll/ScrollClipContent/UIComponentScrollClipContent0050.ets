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
struct UIComponentScrollClipContent0050 {
  @State name: string = 'UIComponentScrollClipContent0050';
  @State message: string = 'UIComponentScrollClipContent0050';
  @State scrollSafeAreaPadding: LengthMetrics | undefined | null = new LengthMetrics(0);
  private paddingFlag: number = 0;


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
            switch (this.paddingFlag % 5) {
              case 0:
                this.scrollSafeAreaPadding = new LengthMetrics(0);
                this.paddingFlag++;
                this.message = `scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
                break;
              case 1:
                this.scrollSafeAreaPadding = new LengthMetrics(-10);
                this.paddingFlag++;
                this.message = `scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
                break;
              case 2:
                this.scrollSafeAreaPadding = undefined;
                this.paddingFlag++;
                this.message = `scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
                break;
              case 3:
                this.scrollSafeAreaPadding = null;
                this.paddingFlag++;
                this.message = `scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
                break;
              case 4:
                this.scrollSafeAreaPadding = new LengthMetrics(1000);
                this.paddingFlag++;
                this.message = `scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
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
