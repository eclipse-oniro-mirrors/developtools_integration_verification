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
struct UIComponentArcListScrollBarColor0030 {
  @State name: string = 'UIComponentArcListScrollBarColor0030';
  @State message: string = 'UIComponentArcListScrollBarColor0030';
  @State arr: number[] = [];
  @State fadingEdgeFlag: boolean = true;
  @State numItems: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State colorFlag1: string = '';
  @State metricsColor1: ColorMetrics = ColorMetrics.resourceColor('#ffff00');
  @State colorFlag2: string = '';
  @State metricsColor2: ColorMetrics = ColorMetrics.resourceColor('#ffff00');
  private watchSize: string = '466px';
  private listSize: string = '404px';
  context: UIContext = this.getUIContext();
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));
  tabBar2: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  aboutToAppear(): void {
    this.metricsColor1 = ColorMetrics.resourceColor('#ffff00');
    this.colorFlag1 = '\'#ffff00\'';
    this.metricsColor2 = ColorMetrics.resourceColor('rgb(255, 0, 0)');
    this.colorFlag2 = '\'rgb(255, 0, 0)\'';
  }

  @Builder
  buildList1() {
    Stack() {
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width(this.watchSize)
      .height(this.watchSize)
      .clipShape(new CircleShape({ width: '100%', height: '100%' }))
      .backgroundColor(Color.White)

      ArcList({ initialIndex: 0, header: this.tabBar2 }) {
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
      .scrollBarColor(this.metricsColor1)
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
      .scrollBarColor(this.metricsColor2)
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
    .id(this.name + '_02')
  }

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Text(`scrollBarColor设置为: ${this.colorFlag1}`)
        .margin(5)
      this.buildList1()

      Text(`scrollBarColor设置为: ${this.colorFlag2}`)
        .margin(5)
      this.buildList2()
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
