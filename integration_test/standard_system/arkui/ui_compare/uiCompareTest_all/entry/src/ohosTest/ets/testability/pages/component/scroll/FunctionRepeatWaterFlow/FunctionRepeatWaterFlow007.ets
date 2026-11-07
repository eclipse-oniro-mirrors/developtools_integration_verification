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

@Entry
@Component
struct FunctionRepeatWaterFlow007 {
  @State numbers: number[] = [];
  private caseName: string = 'SUB_ACE_FUNCTION_REPEAT_WATERFLOW_0120';
  @State scrollBarState: BarState = BarState.Off;

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.numbers.push(i + 1);
    }
  }

  build() {
    Column() {
      Column() {
        Text('改变滚动条状态:off->on')
          .fontSize(20)
          .margin(10)
          .fontStyle(FontStyle.Normal)
          .textAlign(TextAlign.Center)
      }.height('10%').width('100%').backgroundColor(0xd0ecfd)
      Column() {
        WaterFlow() {
          Repeat<number>(this.numbers)
            .each((ri: RepeatItem<number>) => {
              FlowItem() {
                Column() {
                  Text('item ' + ri.item)
                    .fontSize(30)
                    .fontStyle(FontStyle.Normal)
                    .textAlign(TextAlign.Center)
                }.width('50%').height('20%').backgroundColor(0xfacdcc)
              }
            })
            .virtualScroll({ totalCount: this.numbers.length })
        }
        .id('WaterFlow')
        .scrollBar(this.scrollBarState)
        .enableScrollInteraction(true)
        .layoutDirection(FlexDirection.Column)
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .cachedCount(0)
        .width('100%')
        .height('100%')
        .border({ width: 1 })
      }.height('80%').width('100%')
      Column() {
        Button('改变滚动条状态')
          .id('changeScrollBarState')
          .stateEffect(true)
          .type(ButtonType.Capsule)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .onClick(() => {
            this.scrollBarState = BarState.On;
            console.info(`${this.caseName} scrollBarState is ${this.scrollBarState}`);
          })
      }
    }
  }
}