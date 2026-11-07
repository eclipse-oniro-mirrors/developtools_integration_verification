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
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, LengthMetrics,
  ComponentContent,
  ColorMetrics,
  CircleShape} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
function buildText() {
  Column() {
    Text('header')
      .fontSize('60px')
      .fontWeight(FontWeight.Bold)
  }.margin(0)
}

@Entry
@Component
struct UIComponentArcListScrollBarColor0050 {
  @State name: string = 'UIComponentArcListScrollBarColor0050';
  @State message: string = 'UIComponentArcListScrollBarColor0050';
  @State arr: number[] = [];
  @State fadingEdgeFlag: boolean = true;
  @State numItems: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State colorFlag: string = '';
  @State metricsColor: ColorMetrics | undefined = ColorMetrics.resourceColor('#ffff00');
  private watchSize: string = '466px'
  private listSize: string = '414px'
  context: UIContext = this.getUIContext()
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  @Builder
  buildList2() {
    Stack() {
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width(this.watchSize)
      .height(this.watchSize)
      .clipShape(new CircleShape({ width: '100%', height: '100%' }))
      .backgroundColor(Color.White)

      ArcList({ initialIndex: 0, header: this.tabBar1 }) {
        ForEach(this.numItems, (item: number, index: number) => {
          ArcListItem() {
            Button('' + item, { type: ButtonType.Capsule })
              .width(this.listSize)
              .height('100px')
              .fontSize('40px')
              .focusable(true)
              .focusOnTouch(true)
              .backgroundColor(0x17A98D)
          }.align(Alignment.Center)
        }, (item: string, index: number) => item + index)
      }
      .space(LengthMetrics.px(10))
      .scrollBarColor(this.metricsColor)
      .scrollBar(BarState.On)
      .borderRadius(this.watchSize)
      .focusable(true)
      .focusOnTouch(true)
      .defaultFocus(true)
    }
    .align(Alignment.Center)
    .width(this.watchSize)
    .height(this.watchSize)
    .border({color: Color.Black, width: 1})
    .borderRadius(this.watchSize)
    .id(this.name + '_01')
  }

  build() {
    Column() {
      Text(this.message)
        .margin(10)
      Text(`scrollBarColor已设置为: ${this.colorFlag}`)
        .margin(5)

        Button('设置scrollBarColor的值为\'sadfasffasfasf\'')
          .onClick(() => {
            try {
              this.metricsColor = ColorMetrics.resourceColor('sadfasffasfasf');
            } catch (err) {
              this.message += '\n设置scrollBarColor的值为\'sadfasffasfasf\'时出错, err.code: ' + (err as BusinessError).code + 'err.message: ' + (err as BusinessError).message;
            }
            this.colorFlag = '\'sadfasffasfasf\'';
          })
          .margin(5)
          .id(this.name + '_02')

        Button('设置scrollBarColor的值为undefined')
          .onClick(() => {
            this.metricsColor = undefined;
            this.colorFlag = 'undefined';
          })
          .margin(5)
          .id(this.name + '_03')

      this.buildList2()
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
