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
struct UIComponentListAndGridListClipContent002 {
  @State message: string = 'Hello';
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  build() {
    Column() {
      Row() {
        Column() {
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
          .scrollBar(BarState.On)
          .safeAreaPadding(LengthMetrics.vp(0))
        }
        .width('50%')
        Column() {
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
          .scrollBar(BarState.On)
          .safeAreaPadding(LengthMetrics.vp(-1))
        }
        .width('50%')
      }
      .width('100%')
      .height('30%')
      Row() {
        Column() {
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
          .scrollBar(BarState.On)
          .safeAreaPadding(LengthMetrics.vp(undefined))
        }
        .width('50%')
        Column() {
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
          .scrollBar(BarState.On)
          .safeAreaPadding(LengthMetrics.vp(null))
        }
        .width('50%')
      }
      .width('100%')
      .height('30%')
      Row() {
        Column() {
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
          .scrollBar(BarState.On)
          .safeAreaPadding(LengthMetrics.vp(150))
        }
        .width('50%')
      }
      .width('100%')
      .height('30%')
    }
  }
}