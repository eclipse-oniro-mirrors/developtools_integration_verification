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
import { ComponentContent } from '@kit.ArkUI';

interface ParamsInterface {
  text: string;
}

@Builder
function buildText(params: ParamsInterface) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 36 })
  }
}

const caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0080';

@Entry
@Component
struct UIComponentListAndGridListLeftSwipDeleteBuilderComponent005 {
  @State message: string = 'endDelete';
  @State arr: string[] = ['0', '1', '2', '3', '4','5','6','7','8','9','10'];
  private scrollerForList: Scroller = new Scroller();
  @State actionAreaDist: number = 70000;

  build() {
    Column() {
      List({ space: 20, scroller: this.scrollerForList }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .swipeAction({
            end: {
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item.toString());
                  this.arr.splice(index, 1);
                });
              },
              actionAreaDistance: this.actionAreaDist,
              builderComponent: new ComponentContent<ParamsInterface>(this.getUIContext(),
                wrapBuilder<[ParamsInterface]>(buildText), {
                  text: this.message
                })
            }
          })
        }, (item: string) => item)
      }
      .height('80%')
      .scrollBar(BarState.On)

      Button('改变滑出组件宽度')
        .id('change')
        .stateEffect(true)
        .onClick(() => {
          this.actionAreaDist = 0;
          console.info(`${caseName} actionAreaDist is ${this.actionAreaDist}.`);
        })
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}