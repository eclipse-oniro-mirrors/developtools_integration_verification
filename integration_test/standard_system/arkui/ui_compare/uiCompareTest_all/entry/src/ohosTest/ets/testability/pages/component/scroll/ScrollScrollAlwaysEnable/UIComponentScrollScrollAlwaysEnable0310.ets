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
import { LengthUnit, screen } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentScrollScrollAlwaysEnable0310 {
  @State name: string = 'UIComponentScrollScrollAlwaysEnable0310';
  @State TAG: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ALWAYSENABLE_0310';
  @State message: string = this.name;
  @State itemIndex: number = -1;
  @State numbers: number[] = [];
  @State originColors: ResourceColor[] = [];
  @State actualColors: ResourceColor[] = [];
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 50;
  @State scrollWidth: Length = 400;
  @State scrollHeight: Length = 300;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 3;
  @State fadingLength: number = 20;
  @State fadingEdgeEnabled: boolean | undefined | null = true;
  @State fadingEdgeOptions: FadingEdgeOptions = {
    fadingEdgeLength: {
      value: this.fadingLength,
      unit: LengthUnit.VP
    }
  };
  @State enableScrollInteractionValue: boolean = false;
  @State alwaysEnableValue: boolean = true;
  @State scrollDirection: ScrollDirection = ScrollDirection.Vertical;
  @State dragFromIndex: number = -1;
  @State dragToIndex: number = -1;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers.push(i);
      this.originColors.push(Color.White);
      this.actualColors.push(Color.White);
    }
  }

  setDragFromIndex(index: number) {
    this.dragFromIndex = index;
  }

  setDragToIndexWithHighlight(index: number) {
    this.dragToIndex = index;
    this.actualColors[index] = Color.Pink;
  }

  restoreOriginColor(index: number) {
    this.actualColors[index] = this.originColors[index];
  }

  setFocusColor(index: number) {
    this.actualColors[index] = Color.Orange;
  }

  swapItemsAndColors(fromIndex: number, toIndex: number): boolean {
    if (fromIndex === -1 || toIndex === -1 || fromIndex === toIndex) {
      return false;
    }

    // 交换数组元素
    let temp = this.numbers[fromIndex];
    this.numbers[fromIndex] = this.numbers[toIndex];
    this.numbers[toIndex] = temp;

    // 交换颜色
    let tempColor = this.originColors[fromIndex];
    this.originColors[fromIndex] = this.originColors[toIndex];
    this.originColors[toIndex] = tempColor;

    return true;
  }

  resetDragState() {
    this.dragFromIndex = -1;
    this.dragToIndex = -1;
  }

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(100)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Row() {

        Button('Switch screen orientation')
          .id(this.name + '_01_1')
          .borderRadius(10)
          .backgroundColor(0x317aff)
          .fontWeight(FontWeight.Bold)
          .fontSize(8)
          .margin(5)
          .width('30%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 20,
            font: {
              size: 8,
              weight: FontWeight.Bold,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(() => {
            let screenClass: screen.Screen | null = null;
            screen.getAllScreens(async (err: BusinessError, data: screen.Screen[]) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(`[${this.TAG}_testpage]: Failed to get all screens. Code:${err.code},message is ${err.message}`);
                return;
              }
              console.info(`[${this.TAG}_testpage]: Succeeded in getting all screens. Data:` + JSON.stringify(data));
              screenClass = data[0];
              if (screenClass.orientation == screen.Orientation.VERTICAL) {
                screenClass.setOrientation(screen.Orientation.HORIZONTAL, (err: BusinessError) => {
                  const errCode: number = err.code;
                  if (errCode) {
                    console.error(`[${this.TAG}_testpage]: Failed to set the horizontal orientation. Code:${err.code},message is ${err.message}`);
                    return;
                  }
                  console.info(`[${this.TAG}_testpage]: Succeeded in setting the horizontal orientation.`);
                });
              } else if (screenClass.orientation == screen.Orientation.HORIZONTAL) {
                screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
                  const errCode: number = err.code;
                  if (errCode) {
                    console.error(`[${this.TAG}_testpage]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
                    return;
                  }
                  console.info(`[${this.TAG}_testpage]: Succeeded in setting the vertical orientation.`);
                })
              } else {
                screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
                  const errCode: number = err.code;
                  if (errCode) {
                    console.error(`[${this.TAG}_testpage]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
                    return;
                  }
                  console.info(`[${this.TAG}_testpage]: Succeeded in setting the vertical orientation.`);
                })
              }
            })
          })

        Button('Switch alwaysEnable: ' + this.alwaysEnableValue)
          .id(this.name + '_01_2')
          .borderRadius(10)
          .backgroundColor(0x317aff)
          .fontWeight(FontWeight.Bold)
          .fontSize(8)
          .margin(5)
          .width('30%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 20,
            font: {
              size: 8,
              weight: FontWeight.Bold,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(() => {
            this.alwaysEnableValue = !this.alwaysEnableValue;
          })
      }
      .width('100%')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.numbers, (item: number, index: number) => {
              Text(item.toString())
                .fontSize(30)
                .fontColor(Color.Red)
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Medium)
                .fontStyle(FontStyle.Italic)
                .border({ width: 1 })
                .lineHeight(20)
                .maxLines(2)
                .margin({
                  left: 5,
                  right: 5,
                  top: 10,
                  bottom: 10
                })
                .id(this.name + '_02_' + item.toString())
                .width(this.itemWidth)
                .height(this.itemHeight)
                .borderRadius(15)
                .backgroundColor(this.actualColors[index])
                .focusable(true)
                .draggable(true)
                .onFocus(() => {
                  console.info(`item ${item} onFocus`);
                  this.message += `\n item ${item} onFocus`;
                  this.setFocusColor(index);
                })
                .onBlur(() => {
                  console.info(`item ${item} onBlur`);
                  this.message += `\n item ${item} onBlur`;
                  this.restoreOriginColor(index);
                })
                .onPreDrag((status: PreDragStatus) => {
                  this.message += `\n item ${item} onPreDrag (index: ${index}, status: ${status})`;
                  console.info(`item ${item} onPreDrag (index: ${index}, status: ${status})`);
                })
                .onDragStart(() => {
                  this.setDragFromIndex(index);
                  this.message += `\n item ${item} onDragStart (index: ${index})`;
                  console.info(`item ${item} onDragStart (index: ${index})`);
                })
                .onDragEnter(() => {
                  this.setDragToIndexWithHighlight(index);
                  this.message += `\n item ${item} onDragEnter (index: ${index})`;
                  console.info(`item ${item} onDragEnter (index: ${index})`);
                })
                .onDragLeave(() => {
                  this.restoreOriginColor(index);
                  this.message += `\n item ${item} onDragLeave (index: ${index})`;
                  console.info(`item ${item} onDragLeave (index: ${index})`);
                })
                .onDragMove((event: DragEvent) => {
                  this.message += `\n item ${item} onDragMove (index: ${index}, x: ${event.getWindowX()}, y: ${event.getWindowY()})`;
                  console.info(`item ${item} onDragMove (index: ${index}, x: ${event.getWindowX()}, y: ${event.getWindowY()})`);
                })
                .onDrop(() => {
                  console.info(`item ${item} onDrop (index: ${index})`);
                  if (this.swapItemsAndColors(this.dragFromIndex, this.dragToIndex)) {
                    this.message += `\n item ${item} onDrop. From index: ${this.dragFromIndex}, To index: ${this.dragToIndex}`;
                  }
                  this.restoreOriginColor(index);
                  this.resetDragState();
                })
                .onDragEnd((event: DragEvent) => {
                  this.message += `\n item ${item} onDragEnd (index: ${index}, result: ${event.getResult()})`;
                  console.info(`item ${item} onDragEnd (index: ${index}, result: ${event.getResult()})`);
                })
          }, (item: number) => item.toString())
        }
      }
      .id(this.name + '_02')
      .fadingEdge(this.fadingEdgeEnabled, this.fadingEdgeOptions)
      .friction(this.frictionValue)
      .edgeEffect(this.edgeEffectValue, {alwaysEnabled: this.alwaysEnableValue})
      .backgroundColor(Color.Grey)
      .enableScrollInteraction(this.enableScrollInteractionValue)
      .scrollable(this.scrollDirection)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(10)
      .backToTop(true)
      .width(this.scrollWidth)
      .height(this.scrollHeight)
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('Scroll onScrollFrameBegin');
        this.message += `\n Scroll onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info('Scroll onWillScroll');
        this.message += `\n Scroll onWillScroll, scrollXOffset: ${xOffset.toString()}, scrollYOffset: ${yOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info('Scroll onDidScroll');
        console.info(xOffset.toString());
        console.info(yOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n Scroll onDidScroll, xOffset: ${xOffset.toString()}, yOffset: ${yOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollEdge((side: Edge) => {
        console.info('Scroll onScrollEdge');
        this.message += `\n Scroll onScrollEdge, side: ${side}`;
      })
      .onScrollStart(() => {
        console.info('Scroll onScrollStart');
        this.message += `\n Scroll onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('Scroll onScrollStop');
        this.message += `\n Scroll onScrollStop`;
      })
      .onReachStart(() => {
        console.info('Scroll onReachStart');
        this.message += `\n Scroll onReachStart`;
      })
      .onReachEnd(() => {
        console.info('Scroll onReachEnd');
        this.message += `\n Scroll onReachEnd`;
      })

      Scroll() {
        Text(this.message)
          .fontSize(10)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Center)
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
      }
      .id(this.name + '_03')
      .friction(0.6)
      .backgroundColor(Color.Yellow)
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('16.39%')
      .margin(10)

    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Green)
    .width('100%')
    .height('100%')

  }

}

