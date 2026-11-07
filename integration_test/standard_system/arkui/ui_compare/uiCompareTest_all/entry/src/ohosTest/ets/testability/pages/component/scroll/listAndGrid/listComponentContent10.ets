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
function buildHeader10() {
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
function buildFooter10() {
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
struct ListComponentContent10 {
  @State hasComponent: boolean = true;
  private uiContext: UIContext = this.getUIContext();
  private listData: string[] = [];
  scrollerForList: Scroller = new Scroller();

  private headerComponent: ComponentContent<Object> | null = null;
  private footerComponent: ComponentContent<Object> | null = null;

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    this.headerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildHeader10));
    this.footerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildFooter10));
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0100')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Row({ space: 10 }) {
        Button('scrollTo')
          .id('scrollToButton_10')
          .onClick(() => {
            this.scrollerForList.scrollTo({ xOffset: 0, yOffset: 500 });
          })
          .fontSize(12)

        Button('scrollBy')
          .id('scrollByButton_10')
          .onClick(() => {
            this.scrollerForList.scrollBy(0, 300);
          })
          .fontSize(12)

        Button('scrollToIndex')
          .id('scrollToIndexButton_10')
          .onClick(() => {
            this.scrollerForList.scrollToIndex(10);
          })
          .fontSize(12)
      }
      .margin({ bottom: 10 });

      List({ space: 10, scroller: this.scrollerForList }) {
        ListItemGroup(
          (this.hasComponent && this.headerComponent && this.footerComponent) ? {
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
      .id('listComponentContent_10')
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

