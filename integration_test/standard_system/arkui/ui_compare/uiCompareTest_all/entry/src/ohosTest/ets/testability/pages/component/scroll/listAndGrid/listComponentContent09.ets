/**
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

@Builder
function buildHeader09() {
  Column() {
    Text('Header')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAABBCC)
  }
}

@Builder
function buildFooter09() {
  Column() {
    Text('Footer')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xCCDDFF)
  }
}

@Entry
@Component
struct ListComponentContent09 {
  private uiContext: UIContext = this.getUIContext();
  private listData: string[] = [];
  @State statusMsg: string = '等待事件触发...';

  private headerComponent: ComponentContent<Object> | null = null;
  private footerComponent: ComponentContent<Object> | null = null;

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    this.headerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildHeader09));
    this.footerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildFooter09));
  }

  addEvent(event: string) {
    this.statusMsg = `${this.statusMsg}\n${event}`;
    console.info('TEST', event);
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0090')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      List({ space: 10 }) {
        ListItemGroup(
          (this.headerComponent && this.footerComponent) ? {
            headerComponent: this.headerComponent,
            footerComponent: this.footerComponent
          } : {}
        ) {
          ForEach(this.listData, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF5F5F5)
            }
          }, (item: string) => item)
        }
      }
      .id('listComponentContent_09')
      .width('100%')
      .layoutWeight(1)
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        this.addEvent(`onScrollIndex: first=${firstIndex}, last=${lastIndex}, center=${centerIndex}`);
      })
      .onReachStart(() => {
        this.addEvent('onReachStart');
      })
      .onReachEnd(() => {
        this.addEvent('onReachEnd');
      })
      .onScrollStart(() => {
        this.addEvent('onScrollStart');
      })
      .onScrollStop(() => {
        this.addEvent('onScrollStop');
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        this.addEvent(`onScrollVisibleContentChange: start index=${start.index}, end index=${end.index}`);
      })

      Divider()
        .margin({ top: 10, bottom: 10 });

      Text('事件日志：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Scroll() {
        Text(this.statusMsg)
          .fontSize(12)
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontColor('#333333');
      }
      .width('100%')
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .borderRadius(4)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto);
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

