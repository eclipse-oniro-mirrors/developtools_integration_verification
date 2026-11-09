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
import { RectShape } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentListAndGridListClipContent009 {
  @State message: string = '值为0';
  @State arr: string[] = ['0', '1', '2', '3', '4','5','6','7','8','9','10'];
  @State RectShapeWidth: number | undefined | undefined | null = 0;
  @State RectShapeHeight: number | undefined | undefined | null = 0;
  @State RectShapeOffSet: Position | undefined | undefined | null = {x: 0, y: 0};

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
      .clipContent(new RectShape().width(this.RectShapeWidth).height(this.RectShapeHeight).offset(this.RectShapeOffSet))
      Row() {
        Button('值为负数')
          .id('-1')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为负数';
            this.RectShapeWidth = -1;
            this.RectShapeHeight = -1;
            this.RectShapeOffSet = { x: -100, y: -100 };
          })
        Button('值为undefined')
          .id('undefined')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为undefined';
            this.RectShapeWidth = undefined;
            this.RectShapeHeight = undefined;
            this.RectShapeOffSet = undefined;
          })
        Button('值为null')
          .id('null')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为null';
            this.RectShapeWidth = null;
            this.RectShapeHeight = null;
            this.RectShapeOffSet = null;
          })
        Button('值为大于容器的尺寸')
          .id('70000')
          .stateEffect(true)
          .onClick(() => {
            this.message = '值为大于容器的尺寸';
            this.RectShapeWidth = 70000;
            this.RectShapeHeight = 70000;
            this.RectShapeOffSet = { x: 70000, y: 70000 };
          })
      }
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}