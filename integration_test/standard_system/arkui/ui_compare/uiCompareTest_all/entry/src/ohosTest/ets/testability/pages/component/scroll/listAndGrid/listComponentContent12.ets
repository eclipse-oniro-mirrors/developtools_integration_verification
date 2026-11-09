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
function buildHeader12() {
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
function buildFooter12() {
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
struct ListComponentContent12 {
  private uiContext: UIContext = this.getUIContext();
  private listData: string[] = [];
  @State childrenMainSize: ChildrenMainSize | null = null;
  @State groupChildrenMainSize: ChildrenMainSize | null = null;

  private headerComponent: ComponentContent<Object> | null = null;
  private footerComponent: ComponentContent<Object> | null = null;

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    // 给List设置ChildrenMainSize
    this.childrenMainSize = new ChildrenMainSize(this.listData.length);
    for (let i = 0; i < this.listData.length; i++) {
      this.childrenMainSize!.update(i, 100);
    }
    // 给ListItemGroup设置ChildrenMainSize
    this.groupChildrenMainSize = new ChildrenMainSize(this.listData.length);
    for (let i = 0; i < this.listData.length; i++) {
      this.groupChildrenMainSize!.update(i, 100);
    }
    this.headerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildHeader12));
    this.footerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildFooter12));
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0120')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      if (this.childrenMainSize && this.groupChildrenMainSize) {
        List({ space: 10 }) {
          ListItemGroup(
            (this.headerComponent && this.footerComponent) ? {
              headerComponent: this.headerComponent,
              footerComponent: this.footerComponent
            } : undefined
          ) {
            ForEach(this.listData, (item: string, index: number) => {
              ListItem() {
                Text(item)
                  .width('100%')
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF5F5F5)
              }
            }, (item: string) => item)
          }
          .childrenMainSize(this.groupChildrenMainSize)
        }
        .id('listComponentContent_12')
        .width('100%')
        .layoutWeight(1)
        .childrenMainSize(this.childrenMainSize)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}
