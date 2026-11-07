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
struct UIComponentScrollFadingEdge0010 {
  @State name: string = 'UIComponentScrollFadingEdge0010';
  @State message: string = 'UIComponentScrollFadingEdge0010';
  @State arr: number[] = [];
  @State fadingEdgeFlag: boolean = true;

  @Styles
  listCard() {
    .backgroundColor(Color.White)
    .height(72)
    .width('100%')
    .borderRadius(12)
  }

  build() {
    Scroll() {
      Column() {
        Text('Scroll Area')
          .width('100%')
          .height('30%')
          .backgroundColor(Color.Yellow)
          .textAlign(TextAlign.Center)

        List({ space: 10 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('item' + item)
                .fontSize(16)
            }
            .listCard()
          }, (item: string) => item)
        }
        .id(this.name + '_01')
        .width('100%')
        .nestedScroll({
          scrollForward: NestedScrollMode.PARENT_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        })

      }
      .width('100%')
    }
    .fadingEdge(this.fadingEdgeFlag,{fadingEdgeLength:LengthMetrics.vp(80)})
    .friction(0.6)
    .backgroundColor('#DCDCDC')
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
  }

  aboutToAppear() {
    for (let i = 0; i < 15; i++) {
      this.arr.push(i);
    }
  }
}
