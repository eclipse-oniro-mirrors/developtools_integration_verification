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
struct UIComponentScrollPullDown0090 {
  @State name: string = 'UIComponentScrollPullDown0090';
  @State message: string = 'UIComponentScrollPullDown0090';
  @State arr: number[] = [];
  @State fadingEdgeFlag: boolean = true;
  @State friction: number = 1.848;

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Column() {
      Text(this.message)
        .backgroundColor(Color.Yellow)
        .textAlign(TextAlign.Center)
        .margin(10)
      Button('Switch friction')
        .id(this.name + '_01')
        .onClick(() => {
          if (this.friction < 5) {
            this.friction = 5;
            this.message = 'friction: ' + this.friction;
          } else {
            this.friction = 1.848;
            this.message = 'friction: ' + this.friction;
          }
        })
        .margin(10)
      Scroll() {
        Column() {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('item' + item)
                .width('100%')
                .height(150)
                .backgroundColor(Color.White)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }
          }, (item: string) => item)
        }
      }
      .id(this.name + '_02')
      .friction(this.friction)
      .edgeEffect(EdgeEffect.Spring)
      .backgroundColor(Color.Brown)
      .width('90%')
      .height('80%')
      .margin(10)
    }
    .backgroundColor(Color.Gray)
    .width('100%')
    .height('100%')
  }
}
