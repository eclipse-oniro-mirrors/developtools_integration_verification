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
import { LengthMetrics, RectShape, uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentScrollClipContent0090 {
  @State name: string = 'UIComponentScrollClipContent0090';
  @State message: string = 'UIComponentScrollClipContent0090';
  @State clipWidth: Length | undefined = '50';
  @State clipHeight: Length | undefined = '100';
  @State clipOffset: Position | undefined = {x: 10, y: 30};
  @State clipWidth1: Length | undefined = -50;
  @State clipHeight1: Length | undefined = 0;
  @State clipOffset1: Position | undefined = undefined;
  @State clipWidth2: Length | undefined = 1000;
  @State clipHeight2: Length | undefined = 2000;
  @State clipOffset2: Position | undefined = {x: -10, y: 0};
  private clipFlag = 1;


  aboutToAppear(): void {
    this.clipWidth = this.clipWidth1;
    this.clipHeight = this.clipHeight1;
    this.clipOffset = this.clipOffset1;
    this.message += `\n clipWidth: ${JSON.stringify(this.clipWidth)}, clipHeight: ${this.clipHeight}, clipOffset: ${JSON.stringify(this.clipOffset)}`;
  }

  build() {
    Column() {
      Column() {
        Text(this.message)
          .margin(10)
          .textAlign(TextAlign.Center)
        Button('Switch clip params')
          .id(this.name + '_01')
          .onClick(() => {
            switch (this.clipFlag) {
              case 1:
                this.clipWidth = this.clipWidth2;
                this.clipHeight = this.clipHeight2;
                this.clipOffset = this.clipOffset2;
                this.clipFlag = 2;
                this.message += `\n clipWidth: ${JSON.stringify(this.clipWidth)}, clipHeight: ${this.clipHeight}, clipOffset: ${JSON.stringify(this.clipOffset)}`;
                break;
              case 2:
                this.clipWidth = this.clipWidth1;
                this.clipHeight = this.clipHeight1;
                this.clipOffset = this.clipOffset1;
                this.clipFlag = 1;
                this.message += `\n clipWidth: ${JSON.stringify(this.clipWidth)}, clipHeight: ${this.clipHeight}, clipOffset: ${JSON.stringify(this.clipOffset)}`;
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
      .clipContent(new RectShape().width(this.clipWidth).height(this.clipHeight).offset(this.clipOffset))
      .width('100%')
      .height('80%')
    }
  }
}
