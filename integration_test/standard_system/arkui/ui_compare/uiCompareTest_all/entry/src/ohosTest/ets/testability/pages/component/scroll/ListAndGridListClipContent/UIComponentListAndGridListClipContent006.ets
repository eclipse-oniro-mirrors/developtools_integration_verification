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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentListAndGridListClipContent006 {
  @State message: string = '值为0';
  @State arr: string[] = ['0', '1', '2', '3', '4','5','6','7','8','9','10'];
  @State top: number | undefined | string | undefined | null = 0;
  @State bottom: number | undefined | string | undefined | null = 0;
  @State left: number | undefined | string | undefined | null = 0;
  @State right: number | undefined | string | undefined | null = 0;

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .height('5%')
        .backgroundColor('#ededed')
      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .height('80%')
      .scrollBar(BarState.On)
      .safeAreaPadding({top: this.top, bottom: this.bottom, left: this.left, right: this.right});
      Row() {
        Button('值为负数')
          .id('-1')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为负数';
            this.top = -1;
            this.bottom = -1;
            this.right = -1;
            this.left = -1;
          })
        Button('值为undefined')
          .id('undefined')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为undefined';
            this.top = undefined;
            this.bottom = undefined;
            this.right = undefined;
            this.left = undefined;
          })
        Button('值为null')
          .id('null')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为null';
            this.top = null;
            this.bottom = null;
            this.right = null;
            this.left = null;
          })
        Button('值为大于容器的尺寸')
          .id('200%')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为大于容器的尺寸';
            this.top = '200%';
            this.bottom = '200%';
            this.right = '200%';
            this.left = '200%';
          })
      }
      .backgroundColor('#ededed')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}