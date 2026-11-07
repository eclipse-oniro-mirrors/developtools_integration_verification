/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


@Entry
@Component
struct PreviewContainer0080 {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State enterEndDeleteAreaString: string = 'not enterEndDeleteArea';
  @State exitEndDeleteAreaString: string = 'not exitEndDeleteArea';
  @State selectedItems: Set<number> = new Set();
  private scroller: ListScroller = new ListScroller();

  @Builder itemEnd() {
    Row() {
      Button('Delete').margin('4vp')
      Button('Set').margin('4vp').onClick(() => {
        this.scroller.closeAllSwipeActions();
      })
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      List({ space: 15, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Row() {
              Checkbox()
                .select(this.selectedItems.has(item))
                .onChange((value: boolean) => {
                  if (value) {
                    this.selectedItems.add(item);
                  } else {
                    this.selectedItems.delete(item);
                  }
                })
                .margin({ right: 12 })
              Text('ListItem ' + item)
                .width('100%')
                .height(80)
                .fontSize(18)
                .textAlign(TextAlign.Start)
                .borderRadius(15)
                .backgroundColor(this.selectedItems.has(item) ? 0xE6F3FF : 0xF5F5F5)
                .padding({ left: 16, right: 16 })
                .fontColor(this.selectedItems.has(item) ? 0x007DFF : 0x333333)
            }
            .width('100%')
            .padding({ left: 8, right: 8 })
          }
          .selectable(true)
          .selected(this.selectedItems.has(item))
          .transition({ type: TransitionType.Delete, opacity: 0, scale: { x: 0, y: 0 } })
          .swipeAction({
            end: {
              builder: () => { this.itemEnd() },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 800, curve: Curve.EaseInOut }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                  this.selectedItems.delete(item);
                });
              },
              actionAreaDistance: 80,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = 'enterEndDeleteArea';
                this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
                this.exitEndDeleteAreaString = 'exitEndDeleteArea';
              }
            }
          })
        }, (item: number) => item.toString())
      }
      .divider({ strokeWidth: 2, color: 0xE0E0E0, startMargin: 20, endMargin: 20 })
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)

      Row() {
        Text(`已选择: ${this.selectedItems.size} 项`).fontSize(16).fontColor(0x666666)
        Blank()
        Text(this.enterEndDeleteAreaString).fontSize(14).fontColor(0xFF6B6B)
      }
      .width('100%')
      .padding({ top: 8, bottom: 4 })

      Text(this.exitEndDeleteAreaString).fontSize(14).fontColor(0x4CAF50)
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}
