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
struct UIComponentListAndGridListClipContent003 {
  @State message: string = '值为0';
  @State arr: string[] = ['0', '1', '2', '3', '4','5','6','7','8','9','10'];
  @State top: number | undefined | undefined | null = 0;
  @State bottom: number | undefined | undefined | null = 0;
  @State end: number | undefined | undefined | null = 0;
  @State start: number | undefined | undefined | null = 0;

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
      .safeAreaPadding({top: LengthMetrics.vp(this.top),
        bottom: LengthMetrics.vp(this.bottom),
        start: LengthMetrics.vp(this.start),
        end: LengthMetrics.vp(this.end)
      });
      Row() {
        Button('值为负数')
          .id('-1')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为负数';
            this.top = -1;
            this.bottom = -1;
            this.end = -1;
            this.start = -1;
          })
        Button('值为undefined')
          .id('undefined')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为undefined';
            this.top = undefined;
            this.bottom = undefined;
            this.end = undefined;
            this.start = undefined;
          })
        Button('值为null')
          .id('null')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为null';
            this.top = null;
            this.bottom = null;
            this.end = null;
            this.start = null;
          })
        Button('值为大于容器的尺寸')
          .id('70000')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为大于容器的尺寸';
            this.top = 70000;
            this.bottom = 70000;
            this.end = 70000;
            this.start = 70000;
          })
      }
      .backgroundColor('#ededed')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}