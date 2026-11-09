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
function buildHeader06() {
  Column() {
    Text('Header with Card Style')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAABBCC)
  }
}

@Builder
function buildFooter06() {
  Column() {
    Text('Footer with Card Style')
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
struct ListComponentContent06 {
  private uiContext: UIContext = this.getUIContext();
  private listData: string[] = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  private headerComponent: ComponentContent<Object> | null = null;
  private footerComponent: ComponentContent<Object> | null = null;

  aboutToAppear() {
    this.headerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildHeader06));
    this.footerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildFooter06));
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0060')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      List({ space: 10 }) {
        ListItemGroup(
          (this.headerComponent && this.footerComponent) ? {
            headerComponent: this.headerComponent,
            footerComponent: this.footerComponent,
            style: ListItemGroupStyle.CARD
          } : { style: ListItemGroupStyle.CARD }
        ) {
          ForEach(this.listData, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(80)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
      }
      .id('listComponentContent_06')
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

